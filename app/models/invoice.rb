class Invoice < ActiveRecord::Base
  belongs_to :contact
  has_many :line_items, dependent: :destroy

  default_scope order(:reference)

  validates :reference, uniqueness: true
  validates :dated_on,                       presence: true
  validates :payment_terms,                  presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :trade_discount_percentage,      presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :settlement_discount_percentage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :contact_id,                     presence: true

  attr_accessible :reference, :dated_on, :payment_terms, :trade_discount_percentage,
    :settlement_discount_percentage, :contact_id

  after_initialize :default_reference_to_next_available, :default_dated_on_to_today

  def due_on
    dated_on + payment_terms
  end

  def trade_discount_multiplier
    trade_discount_percentage / BigDecimal('100')
  end

  def trade_discount
    net_value_before_trade_discount * trade_discount_multiplier
  end

  def trade_discount?
    trade_discount_percentage > 0
  end

  def settlement_discount_multiplier
    settlement_discount_percentage / BigDecimal('100')
  end

  def settlement_discount?
    settlement_discount_percentage > 0
  end

  def net_value_before_trade_discount
    line_items.all.sum(&:net_value)
  end

  def net_value
    net_value_before_trade_discount - trade_discount
  end

  def vat_rate_percentages
    line_items.map(&:vat_rate_percentage).uniq.sort
  end

  def vat_value_before_settlement_discount
    line_items.all.sum(&:vat_value)
  end

  def vat_value_settlement_discount
    vat_value_before_settlement_discount * settlement_discount_multiplier
  end

  # VAT is always rounded down to the nearest penny.
  def vat_value
    (vat_value_before_settlement_discount - vat_value_settlement_discount).floor(2)
  end

  def gross_value
    net_value + vat_value
  end

  private
  def default_dated_on_to_today
    self.dated_on ||= Date.today
  end

  def default_reference_to_next_available
    self.reference ||= self.class.next_available_reference
  end

  def self.next_available_reference
    highest_assigned_reference.succ
  end

  def self.highest_assigned_reference
    connection.execute("SELECT MAX(reference) AS reference FROM #{table_name}").first["reference"] || 'REF 0000'
  end
end
