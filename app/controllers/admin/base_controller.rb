class Admin::BaseController < ApplicationController
  before_filter :password_protect
  layout 'admin'

  def index
  end

  private

  def password_protect
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'ryan' && password == ENV['GODDAMNYOURYAN_ADMIN_PASSWORD']
    end
  end
end
