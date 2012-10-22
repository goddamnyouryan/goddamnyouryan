class Site < ActiveRecord::Base
  attr_accessible :description, :name, :order, :status, :url, :photo, :background_color, :text_color, :dark

  has_attached_file :photo, styles: { list: "600x300#" },
                            storage: :s3, s3_credentials: "#{Rails.root}/config/s3.yml",
                            path: ':id/:style'

  scope :active, where(status: 'active')
  scope :inactive, where(status: 'inactive')
end
