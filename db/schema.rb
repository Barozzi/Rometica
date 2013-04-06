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

ActiveRecord::Schema.define(:version => 20130329133750) do

  create_table "tiles", :force => true do |t|
    t.integer  "level"
    t.integer  "t1"
    t.integer  "t2"
    t.integer  "t3"
    t.integer  "t4"
    t.integer  "t5"
    t.integer  "t6"
    t.integer  "t7"
    t.integer  "t8"
    t.integer  "t9"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "times", :force => true do |t|
    t.integer  "level"
    t.integer  "t1"
    t.integer  "t2"
    t.integer  "t3"
    t.integer  "t4"
    t.integer  "t5"
    t.integer  "t6"
    t.integer  "t7"
    t.integer  "t8"
    t.integer  "t9"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end
end
