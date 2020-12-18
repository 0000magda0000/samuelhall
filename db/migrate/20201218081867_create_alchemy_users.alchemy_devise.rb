# This migration comes from alchemy_devise (originally 20131015124700)
class CreateAlchemyUsers < ActiveRecord::Migration[4.2]
  def up
    return if table_exists?(:alchemy_users)
    create_table "alchemy_users" do |t|
      t.text   "firstname"
      t.text   "lastname"
      t.text   "login"
      t.text   "email"
      t.text   "language"
      t.text   "encrypted_password",     limit: 128, default: "",       null: false
      t.text   "password_salt",          limit: 128, default: "",       null: false
      t.integer  "sign_in_count",                      default: 0,        null: false
      t.integer  "failed_attempts",                    default: 0,        null: false
      t.datetime "last_request_at"
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.text   "current_sign_in_ip"
      t.text   "last_sign_in_ip"
      t.datetime "created_at",                                            null: false
      t.datetime "updated_at",                                            null: false
      t.integer  "creator_id"
      t.integer  "updater_id"
      t.text     "cached_tag_list"
      t.text   "reset_password_token"
      t.datetime "reset_password_sent_at"
    end

    add_index "alchemy_users", ["email"], unique: true
    add_index "alchemy_users", ["login"], unique: true
    add_index "alchemy_users", ["reset_password_token"], unique: true
  end
end
