class Contact < ActiveRecord::Base
  validates :code, uniqueness: true, format: { with: /^[0-9]{4}$/, message: 'must be a four-digit code' }
  validates :name, uniqueness: true, presence: true

  after_initialize :default_code_to_next_available

  private
  def default_code_to_next_available
    self.code ||= next_available_code
  end

  def next_available_code
    highest_assigned_code.succ
  end

  def highest_assigned_code
    self.class.select('MAX(code) AS code').first.try(:code) || '0000'
  end
end
