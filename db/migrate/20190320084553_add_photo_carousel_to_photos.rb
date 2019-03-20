class AddPhotoCarouselToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :photo_carousel, :boolean, default: true
  end
end
