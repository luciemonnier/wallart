class Artist < ApplicationRecord
  has_many :medias, dependent: :destroy
  validates :name, :description, :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
