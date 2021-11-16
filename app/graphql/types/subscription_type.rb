module Types
  class SubscriptionType < Types::BaseObject
    field :newLink, LinkType, null: false, description: 'A new link'

    def new_link
    end
  end
end