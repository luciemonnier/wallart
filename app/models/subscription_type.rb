class SubscriptionType < ApplicationRecord
  has_many :medias
  has_many :users
  monetize :price_cents
end
