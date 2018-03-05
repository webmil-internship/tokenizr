# web version, to start "$rerun app_web.rb"
require 'rubygems'
require 'sinatra'

require './boot'

set :bind, IP
set :port, PORT

get '/' do
  @passkeys = Passkey.reverse_order(:id).all
  erb :index, layout: :sbslayout
end

get '/phrases/:passkey_id' do
  @passkey = Passkey.find(id: params[:passkey_id])
  erb :phrases, layout: :sbslayout
end

get '/search' do
  erb :search, layout: :sbslayout
end

post '/search' do
  CracksMan.new(params[:provider], params[:target], params[:sstring]).handling
  redirect '/'
end
