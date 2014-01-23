class AddTitleImageToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :title_image, :string
  end
end
