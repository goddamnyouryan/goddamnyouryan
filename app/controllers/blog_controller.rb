class BlogController < ApplicationController
  before_filter :find_blog, only: :show
  layout 'blog'

  def index
    @blog = Blog.public_posts.first
    @blogs = Blog.public_posts
    @previous = @blog.previous
    @next = @blog.next
    respond_to do |format|
      format.html { render :show }
      format.rss
    end
  end

  def show
    @previous = @blog.previous
    @next = @blog.next
  end
end
