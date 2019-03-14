class SubscriptionType < ApplicationRecord
  has_many :media
  monetize :price_cents
end
