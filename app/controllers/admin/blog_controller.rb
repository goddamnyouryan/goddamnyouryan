class Admin::BlogController < Admin::BaseController
  before_filter :find_blog, only: [:edit, :update, :destroy]

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create params[:blog]
    if @blog.save
      redirect_to @blog, notice: 'Blog post created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @blog.update_attributes params[:blog]
    if @blog.save
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @title = @blog.title
    @blog.destroy

    redirect_to admin_root_path, notice: "#{@title} deleted"
  end
end
