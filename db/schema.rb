# frozen_string_literal: true

ActiveRecord::Schema[8.1].define(version: 2024_10_10_120100) do
  create_table "clients", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "contact_no", null: false
    t.string "contact_email", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role", default: "client", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "clients", "users"
end
