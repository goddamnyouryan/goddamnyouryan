class Admin::SitesController < Admin::BaseController
  before_filter :find_site, only: [:edit, :update, :destroy]

  def new
    @site = Site.new
  end

  def create
    @site = Site.new site_params
    if @site.save
      redirect_to admin_root_path
    else
      redirect_to new_site_path
    end
  end

  def edit
  end

  def update
    if params[:status]
      @site.update_attributes(status: params[:status])
    else
      @site.update_attributes site_params
    end

    redirect_to admin_root_path, notice: "#{@site.name} updated."
  end

  def destroy
    @site.destroy
    redirect_to admin_root_path, notice: "#{@site.name} deleted."
  end

  def sort
    params[:site].each_with_index do |id, index|
      Site.find(id).update_attribute :position, index + 1
    end
    render nothing: true
  end

  private

  def find_site
    @site = Site.friendly.find params[:id]
  end

  def site_params
    params.require(:site).permit(:description, :name, :order, :status, :url, :photo, :background_color, :text_color, :dark)
  end
end
