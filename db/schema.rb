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

ActiveRecord::Schema.define(version: 20171018091153) do

  create_table "cols", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "teacher"
    t.string "master"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "user_name"
    t.string "pwd"
    t.integer "is_encryption", default: 1
    t.string "name"
    t.string "mobile"
    t.string "qq"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatars"
  end

  create_table "rows", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "mobile"
    t.string "qq"
    t.integer "row_id"
    t.integer "col_id"
    t.integer "grade_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatars"
  end

end
