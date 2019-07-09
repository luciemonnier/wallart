require 'pg_search'

class Media < ApplicationRecord
  belongs_to :artist
  belongs_to :category
  has_many :photos, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :rentals, dependent: :destroy
  belongs_to :subscription_type
  has_many :tags, through: :taggings
  has_many :media_to_package_links
  has_many :packages, through: :media_to_package_links

  include PgSearch
  pg_search_scope :search_by_title_artist_category_and_description,
    against: [:title, :description],
    associated_against: {
      category: [:name],
      artist: [:name]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  mount_uploader :photo, PhotoUploader
end
