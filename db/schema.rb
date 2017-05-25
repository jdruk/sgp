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

ActiveRecord::Schema.define(version: 20170525193105) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "scope"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "function_user_projects", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "function_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "function_user_projects", ["function_id"], name: "index_function_user_projects_on_function_id"
  add_index "function_user_projects", ["project_id"], name: "index_function_user_projects_on_project_id"
  add_index "function_user_projects", ["user_id"], name: "index_function_user_projects_on_user_id"

  create_table "functions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locals", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.integer  "actor_id"
    t.string   "notify_type",        null: false
    t.string   "target_type"
    t.integer  "target_id"
    t.string   "second_target_type"
    t.integer  "second_target_id"
    t.string   "third_target_type"
    t.integer  "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "notifications", ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_story_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "participants", ["user_id"], name: "index_participants_on_user_id"
  add_index "participants", ["user_story_id"], name: "index_participants_on_user_story_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "local_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["local_id"], name: "index_projects_on_local_id"

  create_table "releases", force: :cascade do |t|
    t.string   "version"
    t.date     "deliver_date"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "releases", ["project_id"], name: "index_releases_on_project_id"

  create_table "sprints", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "planning_start_date"
    t.datetime "planning_end_date"
    t.datetime "execution_start_date"
    t.datetime "execution_end_date"
    t.datetime "review_meeting_date"
    t.datetime "retrospective_meeting_date"
    t.integer  "project_id"
    t.integer  "release_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
  end

  add_index "sprints", ["project_id"], name: "index_sprints_on_project_id"
  add_index "sprints", ["release_id"], name: "index_sprints_on_release_id"

  create_table "task_requirements", force: :cascade do |t|
    t.integer  "level"
    t.integer  "task_id"
    t.integer  "ability_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_requirements", ["ability_id"], name: "index_task_requirements_on_ability_id"
  add_index "task_requirements", ["task_id"], name: "index_task_requirements_on_task_id"

  create_table "tasks", force: :cascade do |t|
    t.text     "description"
    t.date     "end_date"
    t.date     "start_date"
    t.integer  "status"
    t.integer  "user_story_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tasks", ["user_story_id"], name: "index_tasks_on_user_story_id"

  create_table "tasks_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks_users", ["task_id"], name: "index_tasks_users_on_task_id"
  add_index "tasks_users", ["user_id"], name: "index_tasks_users_on_user_id"

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "themes", ["project_id"], name: "index_themes_on_project_id"

  create_table "user_abilities", force: :cascade do |t|
    t.integer  "points"
    t.integer  "user_id"
    t.integer  "ability_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_abilities", ["ability_id"], name: "index_user_abilities_on_ability_id"
  add_index "user_abilities", ["user_id"], name: "index_user_abilities_on_user_id"

  create_table "user_languages", force: :cascade do |t|
    t.integer  "proficiency"
    t.integer  "user_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_languages", ["language_id"], name: "index_user_languages_on_language_id"
  add_index "user_languages", ["user_id"], name: "index_user_languages_on_user_id"

  create_table "user_stories", force: :cascade do |t|
    t.text     "description"
    t.integer  "business_value"
    t.integer  "story_points"
    t.integer  "status"
    t.integer  "theme_id"
    t.integer  "sprint_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "project_id"
  end

  add_index "user_stories", ["project_id"], name: "index_user_stories_on_project_id"
  add_index "user_stories", ["sprint_id"], name: "index_user_stories_on_sprint_id"
  add_index "user_stories", ["theme_id"], name: "index_user_stories_on_theme_id"

  create_table "user_story_acceptance_criterions", force: :cascade do |t|
    t.text     "description"
    t.integer  "status"
    t.integer  "user_story_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_story_acceptance_criterions", ["user_story_id"], name: "index_user_story_acceptance_criterions_on_user_story_id"

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
    t.string   "name"
    t.string   "schedule"
    t.integer  "group"
    t.integer  "local_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_tasks", ["task_id"], name: "index_users_tasks_on_task_id"
  add_index "users_tasks", ["user_id"], name: "index_users_tasks_on_user_id"

end
