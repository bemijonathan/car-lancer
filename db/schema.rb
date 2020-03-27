# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_26_225446) do

  create_table "biddings", force: :cascade do |t|
    t.string "amount"
    t.string "description"
    t.integer "work_id"
    t.integer "mechanic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mechanic_id"], name: "index_biddings_on_mechanic_id"
    t.index ["work_id"], name: "index_biddings_on_work_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "bussinessname"
    t.string "photo"
    t.string "location"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.string "table_id"
    t.integer "reciever_id"
    t.string "content"
    t.string "sender_class"
    t.string "reciever_class"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "name"
    t.integer "word_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["word_id"], name: "index_photos_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.string "email"
    t.string "location"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "description"
    t.string "title"
    t.integer "amount"
    t.string "location"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_works_on_user_id"
  end

end
