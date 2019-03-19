class AddDisplayToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :display, :boolean
  end
end
