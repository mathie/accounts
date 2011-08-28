class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :category,         null: false
      t.references :invoice,          null: false
      t.decimal :quantity,            null: false, precision: 16, scale: 8, default:  1
      t.decimal :vat_rate_percentage, null: false, precision: 16, scale: 8, default: 20
      t.decimal :unit_price,          null: false, precision: 16, scale: 8

      t.timestamps null: false
    end

    add_index :line_items, :category_id
    add_index :line_items, :invoice_id
  end
end
