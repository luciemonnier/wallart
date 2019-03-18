class Rental < ApplicationRecord
  validates :user, :media, presence: true
  belongs_to :user
  belongs_to :media
end
