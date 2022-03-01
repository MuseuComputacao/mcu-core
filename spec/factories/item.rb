# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    id_photo { 'Id Photo ' }
    description { Faker::Lorem.paragraph(sentence_count: 1) }
    material { Faker::Lorem.paragraph(sentence_count: 1) }
    reference_measures { Faker::Lorem.paragraph(sentence_count: 1) }
    release_date { Time.now }
    publication_date { nil }
    conservation_state { Faker::Lorem.sentence }
    conservation_description { Faker::Lorem.paragraph(sentence_count: 5) }
    recommendations { Faker::Lorem.paragraph(sentence_count: 5) }
    general_observations { Faker::Lorem.paragraph(sentence_count: 5) }
    origin { 'UFRJ' }
    country { 'Brazil' }
    donor_by { Faker::Name.name }
    donation_date { Time.now }
    localization { Faker::Lorem.sentence }
    user

    factory :invalid_item do
      name { nil }
    end
  end
end
