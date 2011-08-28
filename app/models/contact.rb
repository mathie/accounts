class Contact < ActiveRecord::Base
  include Codeable

  has_many :invoices, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  attr_accessible :code, :name
end
