class BlogController < ApplicationController
  http_basic_authenticate_with :name => 'ryan', :password => 'poophorsebananaschema', except: [:index, :show]
  before_filter :find_blog, only: [:show, :edit, :update, :destroy]
  layout 'blog'

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create params[:blog]
    if @blog.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @blog.update_attributes params[:blog]
    if @blog.save
      redirect_to admin_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_blog
    @blog = Blog.find params[:id]
  end
end