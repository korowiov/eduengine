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

ActiveRecord::Schema.define(version: 2020_03_09_230336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "repositories_accounts", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
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
    t.index ["uuid"], name: "index_repositories_accounts_on_uuid"
  end

  create_table "repositories_authentication_tokens", force: :cascade do |t|
    t.uuid "account_uuid"
    t.string "authentication_token", null: false
    t.string "sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_uuid"], name: "idx_account_on_token"
    t.index ["authentication_token"], name: "idx_value_on_token"
  end

  create_table "repositories_quiz_question_answers", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "quiz_question_option_uuid"
    t.text "content", null: false
    t.boolean "value", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_question_option_uuid"], name: "idx_option_on_answer"
    t.index ["uuid"], name: "index_repositories_quiz_question_answers_on_uuid"
  end

  create_table "repositories_quiz_question_options", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "quiz_question_uuid"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_question_uuid"], name: "idx_option_on_question"
    t.index ["uuid"], name: "index_repositories_quiz_question_options_on_uuid"
  end

  create_table "repositories_quiz_questions", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "resource_uuid"
    t.string "question_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_type"], name: "index_repositories_quiz_questions_on_question_type"
    t.index ["resource_uuid"], name: "idx_quiz_on_question"
    t.index ["uuid"], name: "index_repositories_quiz_questions_on_uuid"
  end

  create_table "repositories_resources", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "author_uuid"
    t.string "name", null: false
    t.text "description"
    t.jsonb "settings", default: {}
    t.string "status", default: "draft", null: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "published_at"
    t.index ["author_uuid"], name: "idx_author_on_resource"
    t.index ["type"], name: "index_repositories_resources_on_type"
    t.index ["uuid"], name: "index_repositories_resources_on_uuid"
  end

end
