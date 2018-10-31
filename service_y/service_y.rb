require 'rubygems'
require 'bundler/setup'

Bundler.require

set :port, 8080

get '/' do
  'Service Y'
end
