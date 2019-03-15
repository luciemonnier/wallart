class ChangeDefaultLevelToSubscriptionTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :subscription_types, :level, :integer, default: 0
  end
end
