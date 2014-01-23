class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attr_accessible :body, :title, :private, :title_image, :dark

  validates_presence_of :title, :body

  default_scope order('created_at desc')
  scope :private, -> { where(private: true) }
  scope :public, -> { where(private: false) }

  def next
    Blog.unscoped.public.where('id > ?', self.id).order('created_at asc').first
  end

  def previous
    Blog.public.where('id < ?', self.id).first
  end
end
