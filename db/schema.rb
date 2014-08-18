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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140818165850) do

  create_table "boards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "board_id"
    t.integer  "role_mask"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["board_id"], name: "index_memberships_on_board_id"
  add_index "memberships", ["role_mask"], name: "index_memberships_on_role_mask"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
