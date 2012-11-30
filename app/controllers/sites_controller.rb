class SitesController < ApplicationController
  http_basic_authenticate_with :name => 'ryan', :password => 'poophorsebananaschema', except: [:index, :contact]

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

  def sort
    params[:site].each_with_index do |id, index|
      Site.update_all({position: index + 1}, { id: id })
    end
    render nothing: true
  end

  def contact
    SitesMailer.contact_form(params[:name], params[:email], params[:body]).deliver
    respond_to do |format|
      format.js
    end
  end
end
