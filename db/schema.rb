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

ActiveRecord::Schema.define(version: 2020_11_10_192931) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "genre_cuisine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street_name"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.string "country"
    t.integer "latitude"
    t.integer "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "choice_activities", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "choice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_choice_activities_on_activity_id"
    t.index ["choice_id"], name: "index_choice_activities_on_choice_id"
  end

  create_table "choices", force: :cascade do |t|
    t.string "choice_name"
    t.date "date"
    t.boolean "completed"
    t.integer "location_zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_choices", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "choice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["choice_id"], name: "index_user_choices_on_choice_id"
    t.index ["user_id"], name: "index_user_choices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.integer "address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_users_on_address_id"
  end

  add_foreign_key "choice_activities", "activities"
  add_foreign_key "choice_activities", "choices"
  add_foreign_key "user_choices", "choices"
  add_foreign_key "user_choices", "users"
  add_foreign_key "users", "addresses"
end
