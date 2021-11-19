# frozen_string_literal: true

FactoryBot.define do
  factory :reaction do
    name { 1 }
    user
    association :reactionable, factory: :comment
  end
end
