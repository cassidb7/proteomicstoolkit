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

ActiveRecord::Schema.define(version: 2019_03_02_002017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.bigint "document_id"
    t.string "sequence"
    t.string "protein"
    t.string "gene"
    t.decimal "intensity_1"
    t.decimal "intensity_2"
    t.decimal "intensity_3"
    t.decimal "intensity_4"
    t.decimal "intensity_5"
    t.decimal "intensity_6"
    t.decimal "intensity_7"
    t.decimal "intensity_8"
    t.decimal "intensity_9"
    t.decimal "intensity_10"
    t.decimal "intensity_11"
    t.decimal "intensity_12"
    t.decimal "intensity_13"
    t.decimal "intensity_14"
    t.decimal "intensity_15"
    t.decimal "intensity_16"
    t.decimal "intensity_17"
    t.decimal "intensity_18"
    t.decimal "intensity_19"
    t.decimal "intensity_20"
    t.decimal "intensity_21"
    t.decimal "intensity_22"
    t.decimal "intensity_23"
    t.decimal "intensity_24"
    t.decimal "intensity_25"
    t.decimal "intensity_26"
    t.decimal "intensity_27"
    t.decimal "intensity_28"
    t.decimal "intensity_29"
    t.decimal "intensity_30"
    t.decimal "intensity_31"
    t.decimal "intensity_32"
    t.decimal "intensity_33"
    t.decimal "intensity_34"
    t.decimal "intensity_35"
    t.decimal "intensity_36"
    t.decimal "intensity_37"
    t.decimal "intensity_38"
    t.decimal "intensity_39"
    t.decimal "intensity_40"
    t.decimal "intensity_41"
    t.decimal "intensity_42"
    t.decimal "intensity_43"
    t.decimal "intensity_44"
    t.decimal "intensity_45"
    t.decimal "intensity_46"
    t.decimal "intensity_47"
    t.decimal "intensity_48"
    t.decimal "intensity_49"
    t.decimal "intensity_50"
    t.decimal "intensity_51"
    t.decimal "intensity_52"
    t.decimal "intensity_53"
    t.decimal "intensity_54"
    t.decimal "intensity_55"
    t.decimal "intensity_56"
    t.decimal "intensity_57"
    t.decimal "intensity_58"
    t.decimal "intensity_59"
    t.decimal "intensity_60"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_contents_on_document_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.boolean "complete", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "headers", force: :cascade do |t|
    t.bigint "document_id"
    t.string "name"
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_headers_on_document_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
