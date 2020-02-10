# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_01_225854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "repositories_accounts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "password_digest"
    t.integer "sign_in_count", default: 0, null: false
    t.string "nickname", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_repositories_accounts_on_email"
    t.index ["nickname"], name: "index_repositories_accounts_on_nickname"
  end

  create_table "repositories_authentication_tokens", force: :cascade do |t|
    t.uuid "repositories_account_id"
    t.string "authentication_token", null: false
    t.string "sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authentication_token"], name: "token_on_authentication_tokens"
    t.index ["repositories_account_id"], name: "account_on_authentication_tokens"
  end

  create_table "repositories_quiz_question_answers", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "repositories_quiz_question_id"
    t.text "content", null: false
    t.boolean "value", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repositories_quiz_question_id"], name: "answer_on_quiz_question"
  end

  create_table "repositories_quiz_question_instances", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "quiz_id"
    t.string "question_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_type"], name: "index_repositories_quiz_question_instances_on_question_type"
    t.index ["quiz_id"], name: "index_repositories_quiz_question_instances_on_quiz_id"
  end

  create_table "repositories_quiz_questions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "repositories_quiz_question_instance_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repositories_quiz_question_instance_id"], name: "question_on_question_instace"
  end

  create_table "repositories_resources", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "author_id"
    t.string "name", null: false
    t.text "description"
    t.jsonb "settings", default: {}
    t.string "status", default: "draft", null: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_repositories_resources_on_author_id"
    t.index ["type"], name: "index_repositories_resources_on_type"
  end

  add_foreign_key "repositories_authentication_tokens", "repositories_accounts"
  add_foreign_key "repositories_quiz_question_answers", "repositories_quiz_questions"
  add_foreign_key "repositories_quiz_questions", "repositories_quiz_question_instances"
end
