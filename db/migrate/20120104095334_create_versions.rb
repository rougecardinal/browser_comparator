class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :name
      t.date :date_release
      t.integer :browser_family_id

      t.timestamps
    end
  end
end
