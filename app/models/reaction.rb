# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactionable, polymorphic: true
  enum name: { like: 0, smile: 1, up: 2 }
end
