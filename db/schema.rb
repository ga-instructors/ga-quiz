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

ActiveRecord::Schema.define(version: 20150604035015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id", using: :btree
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_regroup_group_members", force: :cascade do |t|
    t.integer  "regroup_group_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "groups_regroup_group_members", ["regroup_group_id"], name: "index_groups_regroup_group_members_on_regroup_group_id", using: :btree
  add_index "groups_regroup_group_members", ["user_id"], name: "index_groups_regroup_group_members_on_user_id", using: :btree

  create_table "groups_regroup_groups", force: :cascade do |t|
    t.integer  "regroup_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups_regroup_groups", ["regroup_id"], name: "index_groups_regroup_groups_on_regroup_id", using: :btree

  create_table "groups_regroups", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.integer  "target_group_size"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "groups_regroups", ["group_id"], name: "index_groups_regroups_on_group_id", using: :btree

  create_table "quizzes_answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "assessment_id"
    t.integer  "question_id"
    t.integer  "question_option_id"
    t.text     "answer"
    t.float    "grade"
    t.text     "reviewer_comment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "quizzes_answers", ["assessment_id"], name: "index_quizzes_answers_on_assessment_id", using: :btree
  add_index "quizzes_answers", ["question_id"], name: "index_quizzes_answers_on_question_id", using: :btree
  add_index "quizzes_answers", ["user_id"], name: "index_quizzes_answers_on_user_id", using: :btree

  create_table "quizzes_assessments", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "user_id"
    t.text     "student_comment"
    t.datetime "finished_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "graded_at"
  end

  add_index "quizzes_assessments", ["quiz_id"], name: "index_quizzes_assessments_on_quiz_id", using: :btree
  add_index "quizzes_assessments", ["user_id"], name: "index_quizzes_assessments_on_user_id", using: :btree

  create_table "quizzes_question_options", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "label"
    t.float    "grade"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "quizzes_question_options", ["question_id"], name: "index_quizzes_question_options_on_question_id", using: :btree

  create_table "quizzes_questions", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "ordinal"
    t.string   "topic"
    t.text     "question"
    t.boolean  "open_ended",       default: true
    t.text     "answer"
    t.integer  "answer_option_id"
    t.text     "answer_template"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "answer_format"
  end

  add_index "quizzes_questions", ["quiz_id"], name: "index_quizzes_questions_on_quiz_id", using: :btree
  add_index "quizzes_questions", ["topic"], name: "index_quizzes_questions_on_topic", using: :btree

  create_table "quizzes_quizzes", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "ordinal"
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "introduction"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_agent"
    t.string   "ip_address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "country"
    t.string   "region"
    t.string   "city"
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "users"
  add_foreign_key "groups_regroup_group_members", "groups_regroup_groups", column: "regroup_group_id"
  add_foreign_key "groups_regroup_group_members", "users"
  add_foreign_key "groups_regroup_groups", "groups_regroups", column: "regroup_id"
  add_foreign_key "groups_regroups", "groups"
  add_foreign_key "quizzes_answers", "quizzes_assessments", column: "assessment_id"
  add_foreign_key "quizzes_answers", "quizzes_questions", column: "question_id"
  add_foreign_key "quizzes_answers", "users"
  add_foreign_key "quizzes_assessments", "quizzes_quizzes", column: "quiz_id"
  add_foreign_key "quizzes_assessments", "users"
  add_foreign_key "quizzes_question_options", "quizzes_questions", column: "question_id"
  add_foreign_key "quizzes_questions", "quizzes_quizzes", column: "quiz_id"
  add_foreign_key "sessions", "users"
end
