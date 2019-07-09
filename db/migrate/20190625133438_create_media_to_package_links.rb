class CreateMediaToPackageLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :media_to_package_links do |t|
      t.references :media, foreign_key: true
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
