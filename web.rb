# -*- encoding: utf-8 -*-

require 'bundler'
Bundler.require
require 'pry'
load 'event.rb'

set :bind, '0.0.0.0'
set :port, '5000'
get '/bootstrap.css' do
  less :'less/bootstrap', :paths => ['views/less']
end

get '/' do
  haml :index
end

get '/event' do
  haml :event_tables
end

get '/staff' do
  haml :staff
end

get '/event/default' do
  res = { status: 'error' }
  begin
    res[:data] = JSON.parse(open("./public/resources/default.json").read.force_encoding('UTF-8'))
    res[:status] = 'ok'
  rescue
    res[:message] = 'JSONファイルが無いよ'
  end
  @default = res[:data]['cards']
  haml :event_default
end


post '/event/default' do
  request.body.rewind
  res = { status: 'error' }
  begin
    res[:data] = JSON.parse(open("./public/resources/default.json").read.force_encoding('UTF-8'))
    res[:status] = 'ok'
  rescue
    res[:message] = 'JSONファイルが無いよ'
  end
  @default = res[:data]['cards']
  haml :event_default
end

post '/event/generate' do
  content_type :text
  res = {
    status: 'error'
  }
  binding.pry 
 
end

