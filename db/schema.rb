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

ActiveRecord::Schema.define(:version => 20110125164144) do

  create_table "federations", :force => true do |t|
    t.string   "name"
    t.integer  "president_id"
    t.integer  "vice_president_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filiation_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observations", :force => true do |t|
    t.integer  "observed_id"
    t.integer  "observer_id"
    t.string   "observation"
    t.date     "observed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "level"
    t.string   "phone"
    t.string   "email"
    t.integer  "monitor_id"
    t.integer  "supervisor_id"
    t.integer  "school_id"
    t.integer  "federation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.boolean  "uniyoga"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.integer  "federation_id"
    t.integer  "director_id"
    t.integer  "filiation_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unames", :force => true do |t|
    t.string   "name"
    t.integer  "named_id"
    t.string   "named_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "allowed",            :default => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
