class LineItem < ActiveRecord::Base
  VAT_RATES = [
    BigDecimal('0'),
    BigDecimal('5'),
    BigDecimal('17.5'),
    BigDecimal('20')
  ]

  belongs_to :category
  belongs_to :invoice

  validates :quantity,            presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :vat_rate_percentage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :unit_price,          presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category_id,         presence: true
  validates :invoice_id,          presence: true

  def net_value
    quantity * unit_price
  end

  def vat_rate_multiplier
    vat_rate_percentage / BigDecimal('100')
  end

  def vat_value
    (net_value * vat_rate_multiplier).floor(2)
  end
end
