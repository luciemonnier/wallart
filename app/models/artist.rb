class Artist < ApplicationRecord
  has_many :medias
  mount_uploader :photo, PhotoUploader
end
