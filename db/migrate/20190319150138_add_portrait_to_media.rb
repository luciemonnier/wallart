class AddPortraitToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :portrait, :boolean
  end
end
