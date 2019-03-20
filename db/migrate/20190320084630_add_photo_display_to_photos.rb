class AddPhotoDisplayToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :photo_display, :boolean, default: true
  end
end
