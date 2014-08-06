class SitesController < ApplicationController
  http_basic_authenticate_with name: 'ryan', password: ENV['GODDAMNYOURYAN_ADMIN_PASSWORD'], except: [:index, :sitemap]

  def index
    @sites = Site.active
    @message = Message.new
  end
end
