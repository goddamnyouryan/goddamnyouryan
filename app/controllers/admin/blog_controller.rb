class Admin::BlogController < Admin::BaseController
  before_filter :find_blog, only: [:edit, :update, :destroy]

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new blog_params
    if @blog.save
      redirect_to @blog, notice: 'Blog post created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update_attributes blog_params
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

  private

  def blog_params
    params.require(:blog).permit(:body, :title, :private, :title_image, :dark)
  end
end
