# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    role { 'master' }
    uid { email }
    password { '12345678' }
    password_confirmation { password }

    factory :confirmed_user do
      confirmed_at { Time.now }
    end

    factory :user_without_uid do
      uid { '' }
    end

    factory :user_editor do
      role { 'editor' }
    end

    factory :user_cataloger do
      role { 'cataloger' }
    end

    factory :user_curator do
      role { 'curator' }
    end
  end
end
