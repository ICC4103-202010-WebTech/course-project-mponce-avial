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

ActiveRecord::Schema.define(version: 2020_04_14_232917) do

  create_table "blacklists", force: :cascade do |t|
    t.integer "registered_user_id"
    t.integer "banned_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["banned_user_id"], name: "index_blacklists_on_banned_user_id"
    t.index ["registered_user_id"], name: "index_blacklists_on_registered_user_id"
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
    t.string "date_rule"
    t.string "visibility"
    t.boolean "is_from_organization"
    t.integer "registered_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registered_user_id"], name: "index_events_on_registered_user_id"
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

  create_table "organization_members", force: :cascade do |t|
    t.integer "registered_user_id"
    t.integer "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_organization_members_on_organization_id"
    t.index ["registered_user_id"], name: "index_organization_members_on_registered_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "organization_banner"
    t.integer "registered_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registered_user_id"], name: "index_organizations_on_registered_user_id"
  end

  create_table "registered_users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.integer "age"
    t.string "username"
    t.string "email_address"
    t.string "google_account"
    t.string "password"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.integer "registered_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registered_user_id"], name: "index_system_administrators_on_registered_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "profile_picture"
    t.string "banner_picture"
    t.integer "registered_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registered_user_id"], name: "index_user_profiles_on_registered_user_id"
  end

end
