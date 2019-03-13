class RemoveCategoryFromMedia < ActiveRecord::Migration[5.2]
  def change
    remove_column :media, :category
  end
end
