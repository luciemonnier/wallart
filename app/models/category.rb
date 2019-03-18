class Category < ApplicationRecord
  validates :name, :level, :price_cents, presence: true
  has_many :medias
end
