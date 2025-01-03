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

ActiveRecord::Schema[7.1].define(version: 2025_01_03_152856) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "binomes", force: :cascade do |t|
    t.bigint "user_1_id", null: false
    t.bigint "user_2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_1_id"], name: "index_binomes_on_user_1_id"
    t.index ["user_2_id"], name: "index_binomes_on_user_2_id"
  end

  create_table "coachings", force: :cascade do |t|
    t.date "date"
    t.string "adress"
    t.boolean "done"
    t.text "comment"
    t.boolean "paid"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_current"
    t.string "line_of_work"
    t.string "field"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.text "postname"
    t.text "firm"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_1_id", null: false
    t.bigint "user_2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_1_id"], name: "index_favorites_on_user_1_id"
    t.index ["user_2_id"], name: "index_favorites_on_user_2_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "binome_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "reading", default: false
    t.index ["binome_id"], name: "index_messages_on_binome_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "experience_id"
    t.string "line_of_work"
    t.string "field"
    t.string "address"
    t.boolean "is_offering"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "timeshare"
    t.integer "quotite_de_travail"
    t.index ["experience_id"], name: "index_searches_on_experience_id"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "solid_cable_messages", force: :cascade do |t|
    t.text "channel"
    t.text "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel"], name: "index_solid_cable_messages_on_channel"
    t.index ["created_at"], name: "index_solid_cable_messages_on_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.date "date_of_birth"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workflows", force: :cascade do |t|
    t.boolean "create_workspace"
    t.boolean "first_quizz_done"
    t.boolean "second_quizz_done"
    t.boolean "third_quizz_done"
    t.boolean "real_meeting_done"
    t.boolean "company_validation"
    t.integer "first_coaching_id"
    t.boolean "first_coaching_done"
    t.boolean "contract_prepared"
    t.integer "first_month_coaching_id"
    t.integer "second_month_coaching_id"
    t.integer "third_month_coaching_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "binome_id"
    t.index ["binome_id"], name: "index_workflows_on_binome_id"
    t.index ["first_coaching_id"], name: "index_workflows_on_first_coaching_id"
    t.index ["first_month_coaching_id"], name: "index_workflows_on_first_month_coaching_id"
    t.index ["second_month_coaching_id"], name: "index_workflows_on_second_month_coaching_id"
    t.index ["third_month_coaching_id"], name: "index_workflows_on_third_month_coaching_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "binomes", "users", column: "user_1_id"
  add_foreign_key "binomes", "users", column: "user_2_id"
  add_foreign_key "experiences", "users"
  add_foreign_key "favorites", "users", column: "user_1_id"
  add_foreign_key "favorites", "users", column: "user_2_id"
  add_foreign_key "messages", "binomes"
  add_foreign_key "messages", "users"
  add_foreign_key "searches", "experiences"
  add_foreign_key "searches", "users"
  add_foreign_key "workflows", "binomes"
  add_foreign_key "workflows", "coachings", column: "first_coaching_id"
  add_foreign_key "workflows", "coachings", column: "first_month_coaching_id"
  add_foreign_key "workflows", "coachings", column: "second_month_coaching_id"
  add_foreign_key "workflows", "coachings", column: "third_month_coaching_id"
end
