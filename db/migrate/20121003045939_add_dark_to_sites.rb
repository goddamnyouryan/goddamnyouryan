class AddDarkToSites < ActiveRecord::Migration
  def change
    add_column :sites, :dark, :boolean
  end
end
