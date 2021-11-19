# frozen_string_literal: true

class Link < ApplicationRecord
  after_save :notify_subscriber_of_addition

  private

  def notify_subscriber_of_addition
    GraphqlRailsApiSchema.subscriptions.trigger('newLink', {}, self)
  end
end
