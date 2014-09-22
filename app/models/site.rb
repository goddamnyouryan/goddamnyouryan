class Site < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :photo, styles: { list: "584x326#" },
                            storage: :s3, s3_credentials: "#{Rails.root}/config/s3.yml",
                            path: ':id/:style', s3_host_alias: 'assets.goddamnyouryan.com',
                            url: ':s3_alias_url'
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  scope :ordered, -> { order('position') }
  scope :active, -> { where(status: 'active').ordered }
  scope :inactive, -> { where(status: 'inactive').ordered }
end
