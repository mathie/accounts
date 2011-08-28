class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :code, null: false, limit: 4
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :contacts, :code, :unique => true
    add_index :contacts, :name, :unique => true
  end
end