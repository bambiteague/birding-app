ActiveRecord::Schema.define(version: 2021_07_15_183306) do

  create_table "birds", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "species"
    t.text "visual_description"
    t.text "call_description"
    t.integer "quantity"
  end

  create_table "sightings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "location"
    t.string "date_spotted"
    t.integer "user_id"
    t.integer "bird_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "age"
    t.string "username"
    t.text "email"
    t.string "location"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
  end

end
