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

ActiveRecord::Schema.define(:version => 20130221041255) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "homes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "milestones", :force => true do |t|
    t.string   "name"
    t.text     "milestone_desc"
    t.datetime "due_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "requirements", :force => true do |t|
    t.text     "req_desc"
    t.integer  "specification_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "category_id"
  end

  create_table "specifications", :force => true do |t|
    t.string   "name"
    t.text     "spec_desc"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "task_category_id"
    t.integer  "category_id"
  end

  create_table "task_categories", :force => true do |t|
    t.string   "name"
    t.integer  "task_category_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.string   "task_desc"
    t.integer  "est_hour"
    t.integer  "est_minute"
    t.integer  "act_hour"
    t.integer  "act_minute"
    t.integer  "priority"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "task_category_id"
    t.integer  "category_id"
    t.integer  "milestone_id"
    t.boolean  "completed"
    t.integer  "user_id"
    t.integer  "assigned_user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "work_times", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
