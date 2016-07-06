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

ActiveRecord::Schema.define(version: 0) do

  create_table "managers", force: :cascade do |t|
    t.string   "name",            limit: 45,              null: false
    t.integer  "group",           limit: 2,               null: false
    t.string   "password_digest", limit: 255
    t.string   "email",           limit: 255,             null: false
    t.datetime "last_login"
    t.integer  "status",          limit: 1,   default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "managers", ["email"], name: "email", using: :btree

  create_table "partner_mails", force: :cascade do |t|
    t.integer  "partner_staff_id",     limit: 4,   null: false
    t.string   "mail_account",         limit: 64,  null: false
    t.string   "mail_domain",          limit: 64,  null: false
    t.string   "serch_hash",           limit: 255, null: false
    t.boolean  "send_flag",                        null: false
    t.boolean  "send_result_flag"
    t.datetime "send_result_modified"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "partner_mails", ["serch_hash"], name: "serch_hash", using: :btree

  create_table "partner_staffs", force: :cascade do |t|
    t.integer  "partner_id",      limit: 4,               null: false
    t.integer  "group",           limit: 1,               null: false
    t.string   "password_digest", limit: 255,             null: false
    t.string   "name",            limit: 255
    t.string   "name_kana",       limit: 255
    t.datetime "last_login"
    t.integer  "status",          limit: 1,   default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "partner_staffs", ["partner_id"], name: "partner_id", using: :btree
  add_index "partner_staffs", ["status"], name: "status", using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "view_name",         limit: 48,              null: false
    t.string   "company_name",      limit: 48
    t.string   "company_name_kana", limit: 48
    t.string   "responsible",       limit: 48
    t.string   "responsible_kana",  limit: 255
    t.integer  "pref_id",           limit: 1
    t.string   "address",           limit: 128
    t.string   "address_kana",      limit: 255
    t.string   "tel",               limit: 12
    t.string   "fax",               limit: 12
    t.integer  "status",            limit: 1,   default: 0, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "partners", ["status"], name: "status", using: :btree

  create_table "prefecture", force: :cascade do |t|
    t.integer  "region_id",  limit: 1
    t.string   "name",       limit: 255
    t.string   "name_kana",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "region", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "name_kana",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "user_data", primary_key: "user_id", force: :cascade do |t|
    t.string   "nickname",         limit: 48,  null: false
    t.string   "family_name",      limit: 48
    t.string   "first_name",       limit: 48
    t.string   "family_name_kana", limit: 255
    t.string   "first_name_kana",  limit: 255
    t.integer  "sex",              limit: 1
    t.date     "birthday"
    t.integer  "pref_id",          limit: 2
    t.integer  "question_id",      limit: 2
    t.string   "question_answer",  limit: 255
    t.integer  "mail_magazine",    limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "user_data", ["nickname"], name: "nickname", using: :btree

  create_table "user_mails", force: :cascade do |t|
    t.integer  "user_id",              limit: 4,   null: false
    t.string   "mail_account",         limit: 64,  null: false
    t.string   "mail_domain",          limit: 64,  null: false
    t.string   "serch_hash",           limit: 255, null: false
    t.boolean  "send_flag",                        null: false
    t.boolean  "send_result_flag"
    t.datetime "send_result_modified"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "user_mails", ["user_id"], name: "user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "group",           limit: 2,               null: false
    t.string   "password_digest", limit: 255,             null: false
    t.datetime "last_login"
    t.integer  "status",          limit: 1,   default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "users", ["status"], name: "status", using: :btree

end
