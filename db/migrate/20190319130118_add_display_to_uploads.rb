class AddDisplayToUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :uploads, :display, :boolean, default: false
  end
end
