# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_07_065340) do
  create_table "addresses", force: :cascade do |t|
    t.text "house"
    t.text "street"
    t.text "landmark"
    t.text "city"
    t.text "state"
    t.text "pincode"
    t.text "country"
    t.integer "cricket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cricket_id"], name: "index_addresses_on_cricket_id"
  end

  create_table "crickets", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "country"
    t.integer "role"
    t.integer "matches_played"
    t.integer "runs_scored"
    t.integer "wickets_taken"
    t.integer "highest_score"
    t.string "best_bowling"
    t.boolean "captain"
    t.boolean "retired"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "phone_numbers"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "ceo_id"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ceo_id"], name: "index_employees_on_ceo_id"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.string "user_name"
    t.integer "role"
    t.string "email"
    t.string "password"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lock_version"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "name"
    t.integer "marks"
    t.string "email"
    t.string "confirmed_email"
    t.boolean "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
  end

  add_foreign_key "addresses", "crickets"
  add_foreign_key "employees", "employees", column: "ceo_id"
  add_foreign_key "employees", "employees", column: "manager_id"
end
