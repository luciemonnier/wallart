class AddSubscriptionTypeToMedia < ActiveRecord::Migration[5.2]
  def change
    add_reference :media, :subscription_type, foreign_key: true
  end
end
