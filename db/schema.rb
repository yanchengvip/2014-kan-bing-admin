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

ActiveRecord::Schema.define(version: 20141105101614) do

  create_table "admin2_menus", force: true do |t|
    t.integer  "admin2_id"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin2s", force: true do |t|
    t.string   "name",                             default: "", null: false
    t.string   "mobile_phone"
    t.string   "password_digest",                  default: "", null: false
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                  default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.string   "email"
    t.integer  "hospital_id",            limit: 8
    t.integer  "department_id",          limit: 8
    t.string   "admin_type"
  end

  add_index "admin2s", ["confirmation_token"], name: "index_admin2s_on_confirmation_token", unique: true, using: :btree
  add_index "admin2s", ["name"], name: "index_admin2s_on_name", unique: true, using: :btree
  add_index "admin2s", ["reset_password_token"], name: "index_admin2s_on_reset_password_token", unique: true, using: :btree
  add_index "admin2s", ["unlock_token"], name: "index_admin2s_on_unlock_token", unique: true, using: :btree

  create_table "admin2s_role2s", force: true do |t|
    t.integer  "admin2_id"
    t.integer  "role2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_permissions", force: true do |t|
    t.integer  "menu_id"
    t.integer  "admin2_id"
    t.string   "hospital_id"
    t.string   "department_id"
    t.boolean  "is_show",       default: true
    t.boolean  "is_edit",       default: false
    t.boolean  "is_add",        default: false
    t.boolean  "is_delete",     default: false
    t.boolean  "is_manage",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority_id"
  end

  create_table "menu_uris", force: true do |t|
    t.string   "menu_name"
    t.string   "menu_uri"
    t.text     "instruction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "uri"
    t.string   "table_name"
    t.string   "model_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_show"
  end

  create_table "national_informations", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role2_menus", force: true do |t|
    t.integer  "role2_id"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role2s", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "instruction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role2s_menu_permissions", force: true do |t|
    t.integer "role2_id"
    t.integer "menu_permission_id"
  end

end
