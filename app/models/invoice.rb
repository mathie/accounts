class Invoice < ActiveRecord::Base
  belongs_to :contact

  default_scope order(:reference)

  validates :reference, uniqueness: true
  validates :dated_on,            presence: true
  validates :payment_terms,       presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :trade_discount,      presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :settlement_discount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :contact_id,          presence: true

  attr_accessible :reference, :dated_on, :payment_terms, :trade_discount,
    :settlement_discount, :contact_id

  after_initialize :default_reference_to_next_available, :default_dated_on_to_today

  def due_on
    dated_on + payment_terms
  end

  def net_value
    15
  end

  def vat_value
    net_value * BigDecimal('0.2')
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
