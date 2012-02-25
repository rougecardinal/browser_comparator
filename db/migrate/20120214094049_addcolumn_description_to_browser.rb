class AddcolumnDescriptionToBrowser < ActiveRecord::Migration
  def up
    add_column :browser_families, :description, :text
    add_column :browser_families, :link, :string
  end

  def down
    remove_column :browser_families, :description, :text
    remove_column :browser_families, :link, :string
  end
end
