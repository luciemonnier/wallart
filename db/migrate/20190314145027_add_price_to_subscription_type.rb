class AddPriceToSubscriptionType < ActiveRecord::Migration[5.2]
  def change
    add_monetize :subscription_types, :price, currency: { present: false }
  end
end
