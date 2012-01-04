class CreateFeatureVersions < ActiveRecord::Migration
  def change
    create_table :feature_versions do |t|
      t.string :value
      t.integer :feature_id
      t.integer :version_id

      t.timestamps
    end
  end
end
