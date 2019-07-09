class MediaToPackageLink < ApplicationRecord
  belongs_to :media
  belongs_to :package
end
