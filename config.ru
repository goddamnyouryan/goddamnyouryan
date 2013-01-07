# This file is used by Rack-based servers to start the application.
require 'rack-rewrite'

use Rack::Rewrite do
  r301 %r{.*}, "http://#{ENV['SITE_URL']}$&", :if => Proc.new { |rack_env| rack_env['SERVER_NAME'].start_with?('www') }
  r301 %r{^(.+)/$}, '$1'
end

require ::File.expand_path('../config/environment',  __FILE__)
run Goddamnyouryan::Application
