module Codeable
  module ClassMethods
    def next_available_code
      highest_assigned_code.succ
    end

    def highest_assigned_code
      connection.execute("SELECT MAX(code) AS code FROM #{table_name}").first["code"] || '0000'
    end
  end

  def self.included(base)
    base.send :default_scope, base.order(:code)
    base.validates :code, uniqueness: true, format: { with: /^[0-9]{4}$/, message: 'must be a four-digit code' }
    base.after_initialize :default_code_to_next_available
    base.extend ClassMethods
  end

  private
  def default_code_to_next_available
    self.code ||= self.class.next_available_code
  end
end
