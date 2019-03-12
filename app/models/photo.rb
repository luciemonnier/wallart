class Photo < ApplicationRecord
  belongs_to :media
  mount_uploader :photo, PhotoUploader
end
