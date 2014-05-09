class Admin::SitesController < Admin::BaseController
  before_filter :find_site, only: [:edit, :update, :destroy]

  def new
    @site = Site.new
  end

  def create
    @site = Site.create params[:site]
    if @site.save
      redirect_to admin_path
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
      @site.update_attributes(params[:site])
    end

    redirect_to admin_root_path, notice: "#{@site.name} updated."
  end

  def destroy
    @site.destroy
    redirect_to admin_root_path, notice: "#{@site.name} deleted."
  end

  def sort
    params[:site].each_with_index do |id, index|
      Site.update_all({position: index + 1}, { id: id })
    end
    render nothing: true
  end

  private

  def find_site
    @site = Site.find params[:id]
  end
end
