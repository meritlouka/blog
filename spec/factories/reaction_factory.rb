FactoryBot.define do
  factory :reaction do
    name { 1 }
    user
    association :reactionable, factory: :comment
  end
end