require 'rubygems'
require 'bundler/setup'

Bundler.require

set :port, 8081

get '/' do
  'Service X'
end

get '/publish' do
  kafka = Kafka.new(["kafka:9092"], client_id: 'service_x')

  kafka.producer.produce('Hello World!', topic: 'greetings')
  kafka.producer.deliver_messages

  { published: 'ok' }
end
