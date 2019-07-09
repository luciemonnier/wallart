class AddPackageToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :package, foreign_key: true
  end
end
