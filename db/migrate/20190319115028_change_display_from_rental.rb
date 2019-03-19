class ChangeDisplayFromRental < ActiveRecord::Migration[5.2]
  def change
    change_column :rentals, :display, :boolean, default: false
  end
end
