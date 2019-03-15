require 'pg_search'

class Media < ApplicationRecord
  belongs_to :artist
  belongs_to :category
  belongs_to :subscription_type
  has_many :photos
  has_many :taggings
  belongs_to :subscription_type
  has_many :tags, through: :taggings

  include PgSearch
  pg_search_scope :search_by_title_category_and_description,
    against: [:title, :description ],
    associated_against: {
      category: [:name]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  #mount_uploader :photo, PhotoUploader
end
