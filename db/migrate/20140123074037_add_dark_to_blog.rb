class AddDarkToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :dark, :boolean, null: false, default: false
  end
end
