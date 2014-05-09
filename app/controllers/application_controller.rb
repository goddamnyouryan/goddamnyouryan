class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_blog
    @blog = Blog.find params[:id]
  end
end
