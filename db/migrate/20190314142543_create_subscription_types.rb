class CreateSubscriptionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :subscription_types do |t|
      t.integer :type
      t.string :name

      t.timestamps
    end
  end
end
