class Category < ActiveRecord::Base
  include Codeable

  validates :name, uniqueness: true, presence: true

  attr_accessible :code, :name
end
