class Photo < ApplicationRecord
  belongs_to :media
  # mount_uploader :url, PhotoUploader
end
