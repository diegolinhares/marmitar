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

ActiveRecord::Schema[7.2].define(version: 2024_06_25_221309) do
  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
  end

  create_table "meal_box_availabilities", force: :cascade do |t|
    t.integer "meal_box_id", null: false
    t.integer "day_of_week", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_box_id"], name: "index_meal_box_availabilities_on_meal_box_id"
  end

  create_table "meal_box_ingredients", force: :cascade do |t|
    t.integer "meal_box_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_meal_box_ingredients_on_ingredient_id"
    t.index ["meal_box_id"], name: "index_meal_box_ingredients_on_meal_box_id"
  end

  create_table "meal_boxes", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.string "name", null: false
    t.string "description"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "BRL", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_meal_boxes_on_name", unique: true
    t.index ["restaurant_id"], name: "index_meal_boxes_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "api_access_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "meal_box_availabilities", "meal_boxes"
  add_foreign_key "meal_box_ingredients", "ingredients"
  add_foreign_key "meal_box_ingredients", "meal_boxes"
  add_foreign_key "meal_boxes", "restaurants"
  add_foreign_key "restaurants", "users"
end
