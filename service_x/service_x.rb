require 'rubygems'
require 'bundler/setup'

Bundler.require

set :port, 8081

get '/' do
  'Service X'
end
