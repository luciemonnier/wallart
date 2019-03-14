class RemoveSubscriptionTypeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :subscription_type
  end
end
