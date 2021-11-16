# frozen_string_literal: true

class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    after_save :notify_subscriber_of_addition

    private

  def notify_subscriber_of_addition
    GraphqlRailsApiSchema.subscriptions.trigger("newLink", {}, self)
  end
end
