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

ActiveRecord::Schema.define(:version => 20121117193409) do

  create_table "events", :force => true do |t|
    t.integer  "school_id"
    t.datetime "date"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "school_id"
    t.text     "description"
    t.integer  "cost"
    t.boolean  "enabled",     :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.text     "story"
    t.boolean  "enabled",           :default => false
    t.integer  "position",          :default => 0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.datetime "timeline_start_at"
    t.datetime "timeline_end_at"
  end

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.text     "definition_of_service"
    t.string   "area_of_service"
    t.string   "contact"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "position",              :default => 0
    t.boolean  "enabled",               :default => false
  end

  create_table "uploads", :force => true do |t|
    t.text   "description"
    t.string "image"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
