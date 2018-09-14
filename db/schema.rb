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

ActiveRecord::Schema.define(version: 20180911055644) do

  create_table "accounts", force: :cascade do |t|
    t.string   "Oid"
    t.string   "account_reference"
    t.string   "encrypted_password", default: "N/A"
    t.string   "encrypted_pin",      default: "N/A"
    t.string   "name",               default: "N/A"
    t.decimal  "total_balance",      default: 0.0
    t.decimal  "blocked_balance",    default: 0.0
    t.decimal  "available_balance",  default: 0.0
    t.boolean  "blocked",            default: false
    t.datetime "date_blocked"
    t.boolean  "expired",            default: false
    t.date     "date_of_expiry"
    t.string   "bank"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "accounts", ["Oid"], name: "index_accounts_on_Oid", unique: true
  add_index "accounts", ["account_reference"], name: "index_accounts_on_account_reference", unique: true
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "banks", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "account_number"
    t.integer  "account_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "banks", ["account_id"], name: "index_banks_on_account_id"

  create_table "instants", force: :cascade do |t|
    t.string   "Oid"
    t.string   "follio"
    t.integer  "window_hours"
    t.string   "token_code"
    t.datetime "date_of_confirmation"
    t.datetime "date_of_cancelation"
    t.string   "device_of_cancelation"
    t.string   "device_of_transaction"
    t.string   "device_of_confirmation"
    t.boolean  "confirmed"
    t.string   "comment"
    t.integer  "account_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "instants", ["account_id"], name: "index_instants_on_account_id"

  create_table "personals", force: :cascade do |t|
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "first_name"
    t.string   "phone"
    t.binary   "photo"
    t.date     "date_of_birth"
    t.string   "account_reference"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
  end

  add_index "personals", ["user_id"], name: "index_personals_on_user_id"

  create_table "subscriptions", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.decimal  "amount"
    t.decimal  "discount",            default: 0.0
    t.decimal  "deposit"
    t.integer  "max_transactions",    default: 0
    t.decimal  "max_amount",          default: 0.0
    t.decimal  "max_transfer_amount", default: 0.0
    t.boolean  "smart_contracts",     default: false
    t.string   "html"
    t.string   "app_url"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "Oid"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "first_name"
    t.string   "phone"
    t.binary   "photo"
    t.string   "mime_type"
    t.date     "date_of_birth"
    t.string   "account_reference"
    t.boolean  "account_active",         default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username",               default: ""
    t.string   "recovery_text"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "last_sign_in_at"
  end

  add_index "users", ["account_reference"], name: "index_users_on_account_reference", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "vaults", force: :cascade do |t|
    t.string   "name"
    t.string   "password_token"
    t.decimal  "balance"
    t.integer  "account_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "vaults", ["account_id"], name: "index_vaults_on_account_id"

  create_table "wallets", force: :cascade do |t|
    t.string   "Oid"
    t.string   "account_reference"
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.boolean  "blocked",           default: false
    t.datetime "date_blocked"
    t.decimal  "available_balance", default: 0.0
    t.decimal  "blocked_balance",   default: 0.0
    t.integer  "usage_count",       default: 0
    t.integer  "account_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "wallets", ["account_id"], name: "index_wallets_on_account_id"

end
