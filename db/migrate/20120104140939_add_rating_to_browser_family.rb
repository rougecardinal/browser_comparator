class AddRatingToBrowserFamily < ActiveRecord::Migration
  def up
    add_column :browser_families, :rating, :integer
  end

  def down
    remove_column :browser_families, :rating
  end
end
