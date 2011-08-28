# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110828204945) do

  create_table "categories", :force => true do |t|
    t.string   "code",       :limit => 4, :null => false
    t.string   "name",                    :null => false
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "categories", ["code"], :name => "index_categories_on_code", :unique => true
  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "contacts", :force => true do |t|
    t.string   "code",       :limit => 4, :null => false
    t.string   "name",                    :null => false
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "contacts", ["code"], :name => "index_contacts_on_code", :unique => true
  add_index "contacts", ["name"], :name => "index_contacts_on_name", :unique => true

  create_table "invoices", :force => true do |t|
    t.string   "reference",                                                                      :null => false
    t.date     "dated_on",                                                                       :null => false
    t.integer  "payment_terms",                                                 :default => 7,   :null => false
    t.integer  "contact_id",                                                                     :null => false
    t.decimal  "trade_discount_percentage",      :precision => 16, :scale => 8, :default => 0.0, :null => false
    t.decimal  "settlement_discount_percentage", :precision => 16, :scale => 8, :default => 0.0, :null => false
    t.string   "type",                                                                           :null => false
    t.datetime "created_at",                                                                     :null => false
    t.datetime "updated_at",                                                                     :null => false
  end

  add_index "invoices", ["contact_id"], :name => "index_invoices_on_contact_id"
  add_index "invoices", ["reference"], :name => "index_invoices_on_reference", :unique => true

  create_table "line_items", :force => true do |t|
    t.integer  "category_id",                                                          :null => false
    t.integer  "invoice_id",                                                           :null => false
    t.decimal  "quantity",            :precision => 16, :scale => 8, :default => 1.0,  :null => false
    t.decimal  "vat_rate_percentage", :precision => 16, :scale => 8, :default => 20.0, :null => false
    t.decimal  "unit_price",          :precision => 16, :scale => 8,                   :null => false
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
  end

  add_index "line_items", ["category_id"], :name => "index_line_items_on_category_id"
  add_index "line_items", ["invoice_id"], :name => "index_line_items_on_invoice_id"

end
