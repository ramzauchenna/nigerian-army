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

ActiveRecord::Schema.define(version: 20160420140815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "applicants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "oname"
    t.string   "email"
    t.string   "phone_number"
    t.string   "additional_number"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "doc"
    t.string   "post_code"
    t.integer  "user_id"
    t.string   "application_number"
    t.string   "picture"
    t.string   "army_corp"
    t.text     "specialization"
    t.integer  "exam_centre_id"
    t.string   "title"
    t.date     "dob"
    t.string   "sob"
    t.string   "town"
    t.integer  "lga_o_origin_id"
    t.integer  "state_of_origin_id"
    t.float    "height"
    t.string   "gender"
    t.string   "religion"
    t.string   "marital_status"
    t.integer  "no_of_children"
    t.integer  "residential_address_id"
    t.integer  "contct_address_id"
    t.string   "hobbies"
    t.boolean  "tribal_marks"
    t.boolean  "tattoo"
    t.string   "nok_fullname"
    t.string   "nok_relationship"
    t.integer  "nok_contact_address_id"
    t.integer  "nok_occupation_id"
    t.string   "nok_post"
    t.string   "nok_phone_number"
    t.string   "nok_email"
    t.string   "parent_fullname"
    t.integer  "parent_address_id"
    t.string   "parent_phone_number"
    t.string   "parent_email"
    t.boolean  "served"
    t.text     "served_details"
    t.text     "served_leaving_reason"
    t.boolean  "police_detained"
    t.text     "police_detained_reason"
    t.string   "police_detained_duration"
    t.boolean  "conviction"
    t.text     "conviction_reason"
    t.text     "conviction_details"
    t.boolean  "travel"
    t.text     "travel_details"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "workflow_state"
    t.string   "lga"
    t.string   "sor"
    t.text     "residential_address"
    t.text     "contact_address"
    t.text     "nok_contact_address"
    t.string   "nok_occupation"
    t.text     "parent_address"
    t.string   "referee1_fullname"
    t.string   "referee1_phone_number"
    t.text     "referee1_contact_address"
    t.string   "referee2_fullname"
    t.string   "referee2_phone_number"
    t.text     "referee2_contact_address"
    t.string   "referee3_fullname"
    t.string   "referee3_phone_number"
    t.text     "referee3_contact_address"
    t.string   "intake"
    t.boolean  "commenced"
    t.string   "centre"
    t.string   "zone"
    t.boolean  "declared"
    t.string   "declared_full_name"
    t.integer  "subject_1"
    t.string   "grade_1"
    t.integer  "subject_2"
    t.string   "grade_2"
    t.integer  "subject_3"
    t.string   "grade_3"
    t.integer  "subject_4"
    t.string   "grade_4"
    t.integer  "subject_5"
    t.string   "grade_5"
    t.integer  "subject_6"
    t.string   "grade_6"
    t.jsonb    "paper",                    default: {}
    t.jsonb    "institutions",             default: {}, null: false
  end

  add_index "applicants", ["institutions"], name: "index_applicants_on_institutions", using: :gin
  add_index "applicants", ["paper"], name: "index_applicants_on_paper", using: :gin

  create_table "army_corps", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "centres", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "classification"
    t.string   "zone"
  end

  create_table "codes", force: :cascade do |t|
    t.string   "full"
    t.string   "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "educations", force: :cascade do |t|
    t.integer  "applicant_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "institution"
    t.string   "degree"
    t.string   "course"
    t.string   "specialization"
    t.string   "location"
    t.string   "country"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lgas", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "subject"
    t.string   "grade"
    t.integer  "exam_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "name"
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "applicant_id"
    t.string   "grade"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "results", ["applicant_id"], name: "index_results_on_applicant_id", using: :btree
  add_index "results", ["subject_id"], name: "index_results_on_subject_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "schools", force: :cascade do |t|
    t.integer  "applicant_id"
    t.string   "name"
    t.integer  "qualification_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "level"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "name"
    t.integer  "army_corp_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
