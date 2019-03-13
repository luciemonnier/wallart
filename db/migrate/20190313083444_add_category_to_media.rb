class AddCategoryToMedia < ActiveRecord::Migration[5.2]
  def change
    add_reference :media, :category, foreign_key: true
  end
end
