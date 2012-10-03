class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :order
      t.string :status, { null: false, default: 'active' }

      t.timestamps
    end
  end
end
