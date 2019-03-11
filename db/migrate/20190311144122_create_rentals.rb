class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :user, foreign_key: true
      t.references :media, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
