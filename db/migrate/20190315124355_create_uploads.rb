class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.references :user, foreign_key: true
      t.string :photo
      t.string :name

      t.timestamps
    end
  end
end
