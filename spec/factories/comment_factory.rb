# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph(sentence_count: 3) }
    user
    post
  end
end
