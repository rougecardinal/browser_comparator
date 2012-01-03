class CreateBrowserFamilies < ActiveRecord::Migration
  def change
    create_table :browser_families do |t|
      t.string :name
      t.string :prod_society

      t.timestamps
    end
  end
end
