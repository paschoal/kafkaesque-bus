require 'rubygems'
require 'bundler/setup'

Bundler.require

set :port, 8080


get '/' do
  'Service Y'
end

get '/read' do
  kafka = Kafka.new(["kafka:9092"], client_id: 'service_y')
  consumer = kafka.consumer(group_id: 'consumers')
  consumer.subscribe('greetings')

  messages = []
  consumer.each_message do |package|
    messages.push({
      topic: package.topic,
      partition: package.partition,
      key: package.key,
      message: package.message,
      offset: package.offset
    })
  end

  { messages: messages }
end
