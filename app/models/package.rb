class Package < ApplicationRecord
  has_many :users
  has_many :media_to_package_links
  has_many :medias, through: :media_to_package_links
  monetize :price_cents
end
