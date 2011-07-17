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

ActiveRecord::Schema.define(:version => 20110717230124) do

  create_table "competitions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "status",      :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "solutions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "problem_id"
    t.integer  "programming_language"
    t.text     "source_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "competition_id"
    t.integer  "role_id"
  end

  add_index "users", ["competition_id"], :name => "index_users_on_competition_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
