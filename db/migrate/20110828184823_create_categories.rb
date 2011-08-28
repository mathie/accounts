class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :code, null: false, limit: 4
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :categories, :code, :unique => true
    add_index :categories, :name, :unique => true
  end
end