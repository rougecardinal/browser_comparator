class CreateOsVersions < ActiveRecord::Migration
  def change
    create_table :os_versions do |t|
      t.integer :os_id
      t.integer :version_id

      t.timestamps
    end
  end
end
