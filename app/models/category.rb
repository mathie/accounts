class Category < ActiveRecord::Base
  include Codeable

  validates :name, uniqueness: true, presence: true
end
