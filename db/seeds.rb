# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

master_user = User.find_or_create_by!(email: 'master@mcu.com') do |user|
  user.name = 'MCU Master'
  user.password = '123456789'
  user.password_confirmation = '123456789'
  user.role = 'master'
end

master_user.confirm unless master_user.confirmed?
