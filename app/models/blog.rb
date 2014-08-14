class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  default_scope { order('created_at desc') }
  scope :public_posts, -> { where(private: false) }

  def next
    Blog.unscoped.public_posts.where('id > ?', self.id).order('created_at asc').first
  end

  def previous
    Blog.public_posts.where('id < ?', self.id).first
  end
end
