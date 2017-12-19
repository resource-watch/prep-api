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

ActiveRecord::Schema.define(version: 20171219124650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "content_images", force: :cascade do |t|
    t.integer "dashboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "dashboards", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "summary"
    t.text "content"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "published", default: false
    t.integer "partner_id"
    t.integer "indicator_id"
    t.text "related_datasets", default: [], array: true
    t.string "attribution"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["indicator_id"], name: "index_dashboards_on_indicator_id"
    t.index ["partner_id"], name: "index_dashboards_on_partner_id"
  end

  create_table "dashboards_connections", id: false, force: :cascade do |t|
    t.integer "dashboard_source_id", null: false
    t.integer "dashboard_target_id", null: false
  end

  create_table "dashboards_insights", id: false, force: :cascade do |t|
    t.bigint "dashboard_id", null: false
    t.bigint "insight_id", null: false
    t.index ["dashboard_id"], name: "index_dashboards_insights_on_dashboard_id"
    t.index ["insight_id"], name: "index_dashboards_insights_on_insight_id"
  end

  create_table "dashboards_tools", id: false, force: :cascade do |t|
    t.bigint "dashboard_id", null: false
    t.bigint "tool_id", null: false
    t.index ["dashboard_id"], name: "index_dashboards_tools_on_dashboard_id"
    t.index ["tool_id"], name: "index_dashboards_tools_on_tool_id"
  end

  create_table "indicators", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.text "content"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicators_widgets", id: false, force: :cascade do |t|
    t.bigint "indicator_id", null: false
    t.bigint "widget_id", null: false
    t.index ["indicator_id"], name: "index_indicators_widgets_on_indicator_id"
    t.index ["widget_id"], name: "index_indicators_widgets_on_widget_id"
  end

  create_table "insights", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "summary"
    t.text "content"
    t.string "content_url"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "published", default: false
    t.integer "partner_id"
    t.string "attribution"
    t.integer "template_type", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "embeddable", default: true
    t.index ["partner_id"], name: "index_insights_on_partner_id"
  end

  create_table "partners", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "url"
    t.string "contact_name"
    t.string "contact_email"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "white_logo_file_name"
    t.string "white_logo_content_type"
    t.integer "white_logo_file_size"
    t.datetime "white_logo_updated_at"
    t.boolean "featured"
    t.text "description"
    t.string "thumbnail_file_name"
    t.string "thumbnail_content_type"
    t.integer "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.text "content"
    t.string "partner_type"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "url"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "resource_type"
    t.boolean "published", default: false
  end

  create_table "temporary_content_images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tools", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.string "url"
    t.string "attribution"
    t.boolean "published", default: false
    t.integer "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_tools_on_partner_id"
  end

  create_table "user_dashboards", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "description"
    t.text "content"
    t.boolean "published"
    t.text "summary"
    t.boolean "private"
    t.string "user_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "widget_types", id: :serial, force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "widgets", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.string "slug"
    t.string "data_url"
    t.text "content"
    t.text "widget_config"
    t.boolean "published", default: false
    t.integer "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dataset"
    t.string "visualization"
    t.integer "widget_type_id"
    t.string "attribution"
    t.index ["partner_id"], name: "index_widgets_on_partner_id"
    t.index ["widget_type_id"], name: "index_widgets_on_widget_type_id"
  end

  add_foreign_key "tools", "partners"
end
