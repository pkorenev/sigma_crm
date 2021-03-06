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

ActiveRecord::Schema.define(version: 20150626093635) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.integer  "house_number"
    t.integer  "apartment_number"
    t.integer  "index"
    t.string   "city"
    t.string   "country"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "agreements", force: :cascade do |t|
    t.integer  "building_id"
    t.integer  "client_id"
    t.string   "manager_type"
    t.integer  "manager_id"
    t.datetime "set_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "agreements", ["building_id"], name: "index_agreements_on_building_id"
  add_index "agreements", ["client_id"], name: "index_agreements_on_client_id"

  create_table "apartment_infos", force: :cascade do |t|
    t.text     "exterior_walls_description"
    t.text     "appartment_separator_walls_description"
    t.text     "appartment_inner_separator_walls_description"
    t.text     "height_description"
    t.text     "filling_openings_in_walls_description"
    t.text     "phone_description"
    t.text     "internet_description"
    t.text     "tv_description"
    t.text     "kitchen_stove_description"
    t.text     "wiring_description"
    t.text     "plumbing_description"
    t.text     "heating_description"
    t.text     "ventilation_description"
    t.text     "water_supply_description"
    t.text     "meters_description"
    t.text     "internal_sewer_system_description"
    t.text     "internal_finishing_work_description"
    t.text     "beautification_description"
    t.text     "additional_info"
    t.integer  "building_id"
    t.string   "building_type"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "assets", force: :cascade do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.string   "assetable_type"
    t.integer  "assetable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "type"
    t.integer  "price"
    t.string   "price_currency"
    t.string   "status"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "published"
  end

  create_table "client_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_tags_link_table", force: :cascade do |t|
    t.integer "client_id"
    t.integer "client_tag_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.text     "comment_text"
    t.integer  "comment_author_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "comments", ["comment_author_id"], name: "index_comments_on_comment_author_id"

  create_table "managers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "simple_clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "address"
    t.text     "tags"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "age"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "user_infos", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "identification_number"
    t.string   "phone"
    t.date     "birthday"
    t.string   "user_type"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
