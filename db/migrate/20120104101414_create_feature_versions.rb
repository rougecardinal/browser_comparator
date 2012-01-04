class CreateFeatureVersions < ActiveRecord::Migration
  def change
    create_table :feature_versions do |t|
      t.string :value

      t.timestamps
    end
  end
end
