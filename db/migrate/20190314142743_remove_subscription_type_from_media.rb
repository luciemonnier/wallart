class RemoveSubscriptionTypeFromMedia < ActiveRecord::Migration[5.2]
  def change
    remove_column :media, :subscription_type
  end
end
