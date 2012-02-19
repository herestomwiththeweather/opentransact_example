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

ActiveRecord::Schema.define(:version => 20120219095518) do

  create_table "access_tokens", :force => true do |t|
    t.integer  "person_id"
    t.integer  "client_id"
    t.integer  "refresh_token_id"
    t.string   "token"
    t.string   "secret"
    t.string   "algorithm"
    t.datetime "expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "assets", :force => true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "authorization_codes", :force => true do |t|
    t.integer  "person_id"
    t.integer  "client_id"
    t.string   "token"
    t.string   "redirect_uri"
    t.datetime "expires_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "clients", :force => true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "website"
    t.string   "redirect_uri"
    t.string   "identifier"
    t.string   "secret"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "refresh_tokens", :force => true do |t|
    t.integer  "person_id"
    t.integer  "client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transacts", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "payer_id"
    t.integer  "payee_id"
    t.string   "to"
    t.decimal  "amount",       :precision => 8, :scale => 2, :default => 0.0
    t.string   "note"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.string   "redirect_uri"
    t.string   "for"
  end

end
