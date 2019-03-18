class Photo < ApplicationRecord
  validates :media, :url, presence: true
  belongs_to :media
  #mount_uploader :url, PhotoUploader
end
