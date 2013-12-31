class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attr_accessible :body, :title, :private

  validates_presence_of :title, :body

  scope :private, -> { where(private: true) }
  scope :public, -> { where(private: false) }
end
