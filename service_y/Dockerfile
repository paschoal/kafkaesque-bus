from ruby:2.5-slim

run apt-get update
run apt-get install -y build-essential
run apt-get install -y curl

env install_path /service
run mkdir -p $install_path
workdir $install_path

copy Gemfile .
copy Gemfile.lock .

run bundle install

copy service_y.rb .

cmd ruby service_y.rb -o 0.0.0.0
