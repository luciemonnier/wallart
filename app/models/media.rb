require 'pg_search'

class Media < ApplicationRecord
  belongs_to :artist
  acts_as_taggable

  include PgSearch
  pg_search_scope :search_by_title_and_description,
    against: [:title, :description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
