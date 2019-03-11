class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :title
      t.text :description
      t.references :artist, foreign_key: true
      t.integer :subscription_type
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
