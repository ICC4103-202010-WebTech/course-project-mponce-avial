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

ActiveRecord::Schema.define(version: 2020_06_19_013012) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "blacklists", force: :cascade do |t|
    t.integer "blacklist_owner_id"
    t.integer "banned_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["banned_user_id"], name: "index_blacklists_on_banned_user_id"
    t.index ["blacklist_owner_id"], name: "index_blacklists_on_blacklist_owner_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "profile_picture"
    t.string "text"
    t.string "image"
    t.integer "registered_user_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["registered_user_id"], name: "index_comments_on_registered_user_id"
  end

  create_table "event_guests", force: :cascade do |t|
    t.integer "date_vote"
    t.integer "event_id"
    t.integer "registered_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_guests_on_event_id"
    t.index ["registered_user_id"], name: "index_event_guests_on_registered_user_id"
  end

  create_table "event_images", force: :cascade do |t|
    t.string "image"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_images_on_event_id"
  end

  create_table "event_pdfs", force: :cascade do |t|
    t.string "pdf"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_pdfs_on_event_id"
  end

  create_table "event_videos", force: :cascade do |t|
    t.string "video"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_videos_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "banner"
    t.string "location"
    t.datetime "final_date"
    t.datetime "date1"
    t.datetime "date2"
    t.datetime "date3"
    t.string "date_rule"
    t.string "visibility"
    t.integer "organization_id"
    t.integer "event_creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_creator_id"], name: "index_events_on_event_creator_id"
    t.index ["organization_id"], name: "index_events_on_organization_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.integer "sender_user_id"
    t.integer "destination_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination_user_id"], name: "index_messages_on_destination_user_id"
    t.index ["sender_user_id"], name: "index_messages_on_sender_user_id"
  end

  create_table "organization_admins", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_organization_admins_on_admin_id"
    t.index ["organization_id"], name: "index_organization_admins_on_organization_id"
  end

  create_table "organization_members", force: :cascade do |t|
    t.integer "registered_user_id"
    t.integer "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_organization_members_on_organization_id"
    t.index ["registered_user_id"], name: "index_organization_members_on_registered_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "organization_banner"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registered_users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.integer "age"
    t.string "username"
    t.string "google_account"
    t.string "password"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_registered_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_registered_users_on_reset_password_token", unique: true
  end

  create_table "replies", force: :cascade do |t|
    t.string "profile_picture"
    t.string "text"
    t.string "image"
    t.integer "registered_user_id"
    t.integer "comment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["registered_user_id"], name: "index_replies_on_registered_user_id"
  end

  create_table "system_administrators", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_system_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_system_administrators_on_reset_password_token", unique: true
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "profile_picture"
    t.string "banner_picture"
    t.string "biography"
    t.integer "registered_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registered_user_id"], name: "index_user_profiles_on_registered_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
