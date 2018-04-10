require 'sinatra'
require './lib/link.rb'

class Bookmark_Manager < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  get '/view' do
    erb :view
  end

  get '/add' do
    erb :add
  end




  run! if app_file == $0
end
