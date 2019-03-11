class Media < ApplicationRecord
  belongs_to :artist
  acts_as_taggable
end
