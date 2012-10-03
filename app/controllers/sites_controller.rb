class SitesController < ApplicationController
  http_basic_authenticate_with :name => 'ryan', :password => 'poophorsebananaschema', except: :index
  def index
    @sites = Site.active
  end

  def admin

  end

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
    @site = Site.find params[:id]
  end

  def update
    @site = Site.find params[:id]
    if params[:status]
      @site.update_attributes(status: params[:status])
    else
      @site.update_attributes(params[:site])
    end
    redirect_to admin_path
  end

  def destroy
  end
end
