# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_113_103_534) do # rubocop:disable Metrics/BlockLength
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'features', force: :cascade do |t|
    t.string 'name'
    t.integer 'code'
    t.float 'unit_price'
    t.integer 'max_unit_limit'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'plan_id', null: false
    t.index ['plan_id'], name: 'index_features_on_plan_id'
  end

  create_table 'plans', force: :cascade do |t|
    t.string 'name'
    t.float 'monthly_fee'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_plans_on_user_id'
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.bigint 'plan_id'
    t.bigint 'user_id'
    t.date 'date'
    t.integer 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['plan_id'], name: 'index_subscriptions_on_plan_id'
    t.index ['user_id'], name: 'index_subscriptions_on_user_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.bigint 'subscription_id'
    t.bigint 'user_id'
    t.date 'transactions_date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'amount'
    t.integer 'bill_status'
    t.index ['subscription_id'], name: 'index_transactions_on_subscription_id'
    t.index ['user_id'], name: 'index_transactions_on_user_id'
  end

  create_table 'usages', force: :cascade do |t|
    t.integer 'used_unit', default: 0
    t.bigint 'subscription_id', null: false
    t.float 'extra_usage_bill', default: 0.0
    t.integer 'max_unit_limit'
    t.bigint 'features_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['features_id'], name: 'index_usages_on_features_id'
    t.index ['subscription_id'], name: 'index_usages_on_subscription_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.string 'invitation_token'
    t.datetime 'invitation_created_at'
    t.datetime 'invitation_sent_at'
    t.datetime 'invitation_accepted_at'
    t.integer 'invitation_limit'
    t.string 'invited_by_type'
    t.bigint 'invited_by_id'
    t.integer 'invitations_count', default: 0
    t.integer 'role', default: 1
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['invitation_token'], name: 'index_users_on_invitation_token', unique: true
    t.index ['invited_by_id'], name: 'index_users_on_invited_by_id'
    t.index %w[invited_by_type invited_by_id], name: 'index_users_on_invited_by'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'features', 'plans'
  add_foreign_key 'plans', 'users'
  add_foreign_key 'subscriptions', 'plans'
  add_foreign_key 'subscriptions', 'users'
  add_foreign_key 'transactions', 'subscriptions'
  add_foreign_key 'transactions', 'users'
  add_foreign_key 'usages', 'features', column: 'features_id'
  add_foreign_key 'usages', 'subscriptions'
end
