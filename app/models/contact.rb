class Contact < ActiveRecord::Base
  include Codeable

  has_many :invoices

  validates :name, uniqueness: true, presence: true

  attr_accessible :code, :name
end
