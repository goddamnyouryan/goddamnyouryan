class Site < ActiveRecord::Base
  attr_accessible :description, :name, :order, :status, :url, :photo, :background_color, :text_color, :dark

  has_attached_file :photo, styles: { list: "960x480#" },
                            storage: :s3, s3_credentials: "#{Rails.root}/config/s3.yml",
                            path: ':id/:style'

  scope :ordered, order('position')
  scope :active, where(status: 'active').ordered
  scope :inactive, where(status: 'inactive').ordered
end
