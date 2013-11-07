class AddPrivateFlagToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :private, :boolean, { null: false, default: false }
  end
end
