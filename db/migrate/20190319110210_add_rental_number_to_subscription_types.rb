class AddRentalNumberToSubscriptionTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :subscription_types, :rentals_number, :integer
  end
end
