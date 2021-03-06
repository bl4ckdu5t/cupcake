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

ActiveRecord::Schema.define(version: 20150725091105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "briefs", force: :cascade do |t|
    t.integer  "project_id"
    t.boolean  "is_new",               default: true
    t.string   "company_name"
    t.text     "company_description"
    t.string   "company_address"
    t.string   "city"
    t.string   "phone"
    t.string   "fax"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "slogan"
    t.string   "color_choices"
    t.string   "website"
    t.string   "recommended_website"
    t.text     "website_pages"
    t.text     "card_orientation"
    t.text     "additional"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "user_id"
    t.string   "message"
    t.boolean  "seen",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "design_type"
    t.integer  "package"
    t.string   "title"
    t.string   "description"
    t.string   "state"
    t.integer  "stage"
    t.integer  "duration"
    t.string   "formats"
    t.boolean  "paid",        default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "selections", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "customer_id"
    t.integer  "designer_id"
    t.integer  "rank"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "designer_id"
    t.integer  "project_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
    t.string   "project_file_name"
    t.string   "project_content_type"
    t.integer  "project_file_size"
    t.datetime "project_updated_at"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "usertype"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "company_name"
    t.string   "phone"
    t.string   "city"
    t.string   "state"
    t.integer  "postcode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "specialty"
    t.integer  "submissions"
    t.integer  "earnings"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
