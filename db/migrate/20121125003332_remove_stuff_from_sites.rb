class RemoveStuffFromSites < ActiveRecord::Migration
  def up
    remove_column :sites, :background_color
    remove_column :sites, :text_color
    remove_column :sites, :dark
  end

  def down
  end
end
