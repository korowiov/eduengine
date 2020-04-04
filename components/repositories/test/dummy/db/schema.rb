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

ActiveRecord::Schema.define(version: 2020_04_04_151834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.boolean "expired", default: false
    t.index ["account_uuid"], name: "idx_account_on_token"
    t.index ["authentication_token"], name: "idx_value_on_token"
  end

  create_table "repositories_flashcards", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "resource_uuid"
    t.string "title", null: false
    t.text "front", null: false
    t.text "back", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_uuid"], name: "idx_deck_on_flashcard"
    t.index ["uuid"], name: "index_repositories_flashcards_on_uuid"
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
    t.bigint "subject_id"
    t.integer "associations_counter", default: 0
    t.index ["author_uuid"], name: "idx_author_on_resource"
    t.index ["type"], name: "index_repositories_resources_on_type"
    t.index ["uuid"], name: "index_repositories_resources_on_uuid"
  end

  create_table "repositories_subjects", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug"
    t.string "ancestry"
    t.integer "ancestry_depth", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon_code"
    t.index ["ancestry"], name: "index_repositories_subjects_on_ancestry"
    t.index ["slug"], name: "index_repositories_subjects_on_slug"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "taggings", "tags"
end
