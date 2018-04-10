require 'sinatra'
require './lib/link.rb'

class Bookmark_Manager < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  get '/view' do
    @bookmarks = Link.all
    erb :view
  end

  get '/add' do
    erb :add
  end

  post '/adding' do
    Link.add(params[:'link'])
    redirect '/view'
  end

  run! if app_file == $0
end
