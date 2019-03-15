class RevertDefaultLevelToSubscriptionTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :subscription_types, :level, :integer
  end
end
