class AddAttachmentPhotoToSites < ActiveRecord::Migration
  def self.up
    change_table :sites do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :sites, :photo
  end
end
