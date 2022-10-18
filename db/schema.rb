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

ActiveRecord::Schema.define(version: 2022_10_18_150512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_enrollments", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_project_enrollments_on_developer_id"
    t.index ["project_id"], name: "index_project_enrollments_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.bigint "manager_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_projects_on_manager_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "type", default: "bug", null: false
    t.string "status", default: "new", null: false
    t.bigint "project_id", null: false
    t.bigint "creator_id"
    t.bigint "assigned_to_id"
    t.string "description"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_id"], name: "index_tickets_on_assigned_to_id"
    t.index ["creator_id"], name: "index_tickets_on_creator_id"
    t.index ["project_id"], name: "index_tickets_on_project_id"
    t.index ["title"], name: "index_tickets_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "type", default: "developer", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "project_enrollments", "projects"
  add_foreign_key "project_enrollments", "users", column: "developer_id"
  add_foreign_key "projects", "users", column: "manager_id"
  add_foreign_key "tickets", "projects"
  add_foreign_key "tickets", "users", column: "assigned_to_id"
  add_foreign_key "tickets", "users", column: "creator_id"
end
