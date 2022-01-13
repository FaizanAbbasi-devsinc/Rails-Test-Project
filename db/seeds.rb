# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: 'faizan.shoukat@devsinc.com', password: '123456', role: 0)
# User.create(email: 'abbasi.faizan70@gmail.com', password: '123456', role: 1)
plan1 = Plan.create(name: 'Plan 1', monthly_fee: 150, user_id: user.id)
Feature.create(name: 'Feature 1', code: 1, unit_price: 10, max_unit_limit: 2, plan_id: plan1.id)
Feature.create(name: 'Feature 2', code: 2, unit_price: 8, max_unit_limit: 3, plan_id: plan1.id)
plan2 = Plan.create(name: 'Plan 2', monthly_fee: 100, user_id: user.id)
Feature.create(name: 'Feature 3', code: 3, unit_price: 6, max_unit_limit: 5, plan_id: plan2.id)
Feature.create(name: 'Feature 4', code: 4, unit_price: 3, max_unit_limit: 15, plan_id: plan2.id)
