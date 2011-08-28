class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string     :reference,           null: false
      t.date       :dated_on,            null: false
      t.integer    :payment_terms,       null: false, default: 7
      t.references :contact,             null: false
      t.decimal    :trade_discount,      null: false, default: 0, precision: 16, scale: 8
      t.decimal    :settlement_discount, null: false, default: 0, precision: 16, scale: 8
      t.string     :type,                null: false

      t.timestamps null: false
    end

    add_index :invoices, :contact_id
    add_index :invoices, :reference, :unique => true
  end
end