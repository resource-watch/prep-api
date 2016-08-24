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

ActiveRecord::Schema.define(version: 20160823114003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "dashboards", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "summary"
    t.text     "content"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "published",          default: false
    t.integer  "partner_id"
    t.integer  "indicator_id"
    t.text     "related_datasets",   default: [],    array: true
    t.index ["indicator_id"], name: "index_dashboards_on_indicator_id", using: :btree
    t.index ["partner_id"], name: "index_dashboards_on_partner_id", using: :btree
  end

  create_table "dashboards_connections", id: false, force: :cascade do |t|
    t.integer "dashboard_source_id", null: false
    t.integer "dashboard_target_id", null: false
  end

  create_table "dashboards_insights", id: false, force: :cascade do |t|
    t.integer "dashboard_id", null: false
    t.integer "insight_id",   null: false
    t.index ["dashboard_id"], name: "index_dashboards_insights_on_dashboard_id", using: :btree
    t.index ["insight_id"], name: "index_dashboards_insights_on_insight_id", using: :btree
  end

  create_table "dashboards_tools", id: false, force: :cascade do |t|
    t.integer "dashboard_id", null: false
    t.integer "tool_id",      null: false
    t.index ["dashboard_id"], name: "index_dashboards_tools_on_dashboard_id", using: :btree
    t.index ["tool_id"], name: "index_dashboards_tools_on_tool_id", using: :btree
  end

  create_table "indicators", force: :cascade do |t|
    t.string "title"
    t.text   "summary"
    t.text   "content"
  end

  create_table "indicators_widgets", id: false, force: :cascade do |t|
    t.integer "indicator_id", null: false
    t.integer "widget_id",    null: false
    t.index ["indicator_id"], name: "index_indicators_widgets_on_indicator_id", using: :btree
    t.index ["widget_id"], name: "index_indicators_widgets_on_widget_id", using: :btree
  end

  create_table "insights", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "summary"
    t.text     "content"
    t.string   "content_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "published",          default: false
    t.integer  "partner_id"
    t.index ["partner_id"], name: "index_insights_on_partner_id", using: :btree
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name",                                    null: false
    t.string   "url"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "published",               default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "logo_dimensions"
    t.string   "white_logo_file_name"
    t.string   "white_logo_content_type"
    t.integer  "white_logo_file_size"
    t.datetime "white_logo_updated_at"
    t.boolean  "featured"
  end

  create_table "tools", force: :cascade do |t|
    t.string "title"
    t.text   "summary"
    t.string "url"
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.string   "slug"
    t.string   "data_url"
    t.text     "content"
    t.text     "widget_config"
    t.boolean  "published",     default: false
    t.integer  "partner_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "dataset"
    t.string   "visualization"
    t.index ["partner_id"], name: "index_widgets_on_partner_id", using: :btree
  end

end
