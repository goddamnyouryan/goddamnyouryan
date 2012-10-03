class AddColorsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :background_color, :string
    add_column :sites, :text_color, :string
  end
end
