class RenameOrderToPosition < ActiveRecord::Migration
  def up
    rename_column :sites, :order, :position
  end

  def down
  end
end
