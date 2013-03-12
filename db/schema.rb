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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130305221850) do

  create_table "addresses", :force => true do |t|
    t.string   "hash_key",     :null => false
    t.string   "street"
    t.string   "street2"
    t.string   "city",         :null => false
    t.string   "state",        :null => false
    t.string   "zip_code"
    t.string   "country",      :null => false
    t.string   "country_code", :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "addresses", ["hash_key"], :name => "index_addresses_on_hash_key", :unique => true

  create_table "business_unit_addresses", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "address_type",     :null => false
    t.integer  "business_unit_id", :null => false
    t.integer  "address_id",       :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "business_unit_addresses", ["business_unit_id", "address_id", "name"], :name => "index_bus_unit_addr_on_bus_unit_id_and_address_id_and_name", :unique => true

  create_table "business_units", :force => true do |t|
    t.string   "name",               :null => false
    t.string   "business_unit_type", :null => false
    t.integer  "parent_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "loads", :force => true do |t|
    t.integer  "poster_user_id",                              :null => false
    t.integer  "poster_business_unit_id",                     :null => false
    t.integer  "carrier_business_unit_id"
    t.integer  "carrier_user_id"
    t.integer  "origin_address_id",                           :null => false
    t.integer  "destination_address_id",                      :null => false
    t.integer  "route_id",                                    :null => false
    t.boolean  "is_cross_country",         :default => false, :null => false
    t.date     "pickup_date",                                 :null => false
    t.integer  "pickup_start_time",        :default => 0,     :null => false
    t.integer  "pickup_end_time"
    t.datetime "pickup_start_time_utc",                       :null => false
    t.datetime "pickup_end_time_utc"
    t.boolean  "is_pickup_flexible",       :default => false, :null => false
    t.integer  "pickup_flexible_days"
    t.date     "delivery_date"
    t.integer  "delivery_start_time"
    t.integer  "delivery_end_time"
    t.datetime "delivery_start_time_utc"
    t.datetime "delivery_end_time_utc"
    t.boolean  "is_delivery_flexible",     :default => false, :null => false
    t.integer  "delivery_flexible_days"
    t.string   "equipment_type",                              :null => false
    t.text     "equipment_user_comments"
    t.float    "weight"
    t.string   "weight_unit_type",                            :null => false
    t.float    "dimension_length"
    t.float    "dimension_width"
    t.float    "dimension_height"
    t.float    "volume"
    t.string   "volume_unit_type",                            :null => false
    t.integer  "quantity",                 :default => 1,     :null => false
    t.string   "load_type",                                   :null => false
    t.float    "ltl_feet"
    t.string   "status_code",                                 :null => false
    t.boolean  "is_team_load",             :default => false, :null => false
    t.string   "commodity_type",                              :null => false
    t.text     "commodity_user_comments"
    t.decimal  "offer_amount"
    t.string   "offer_currency_code",                         :null => false
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_ext"
    t.string   "contact_email"
    t.boolean  "is_repeat",                :default => false, :null => false
    t.integer  "repeat_num_days"
    t.date     "repeat_end_date"
    t.integer  "number_extra_stop"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "loads", ["destination_address_id"], :name => "index_loads_on_destination_address_id"
  add_index "loads", ["origin_address_id"], :name => "index_loads_on_origin_address_id"
  add_index "loads", ["route_id"], :name => "index_loads_on_route_id"

  create_table "routes", :force => true do |t|
    t.integer  "origin_address_id",      :null => false
    t.integer  "destination_address_id", :null => false
    t.string   "provider"
    t.float    "distance",               :null => false
    t.string   "distance_unit_type",     :null => false
    t.string   "route_type",             :null => false
    t.datetime "refreshed_on",           :null => false
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "routes", ["origin_address_id", "destination_address_id", "route_type"], :name => "index_routes_on_org_and_dest_addr_ids_and_route_type_code", :unique => true

  create_table "trucks", :force => true do |t|
    t.string   "name",                  :null => false
    t.string   "equipment_type",        :null => false
    t.string   "license_number"
    t.string   "city_registered"
    t.string   "state_registered"
    t.string   "country_registered"
    t.string   "vin"
    t.string   "engine_number"
    t.string   "chassis_number"
    t.integer  "number_axles"
    t.float    "max_load"
    t.float    "empty_weight"
    t.float    "gross_max_weight"
    t.string   "weight_unit_type"
    t.float    "length"
    t.float    "width"
    t.float    "height"
    t.string   "volume_unit_type"
    t.float    "floor_space"
    t.string   "floor_space_unit_type"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "type_elements", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "parent_id"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "type_set_id"
    t.string   "picture"
  end

  add_index "type_elements", ["type_set_id"], :name => "index_type_elements_on_type_set_id"

  create_table "type_sets", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "picture"
  end

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "first_name",       :null => false
    t.string   "last_name",        :null => false
    t.string   "email",            :null => false
    t.string   "telephone"
    t.string   "language_code",    :null => false
    t.integer  "business_unit_id", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
