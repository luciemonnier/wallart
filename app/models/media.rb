require 'pg_search'

class Media < ApplicationRecord
  belongs_to :artist
  has_many :photos
  has_many :taggings
  has_many :tags, through: :taggings

  include PgSearch
  pg_search_scope :search_by_title_category_and_description,
    against: [:title, :description, :category],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  mount_uploader :photo, PhotoUploader
end
