class RenameColumnTypeInSubscriptionType < ActiveRecord::Migration[5.2]
  def change
    rename_column :subscription_types, :type, :level
  end
end
