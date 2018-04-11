require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/link.rb'
require 'uri'

class Bookmark_Manager < Sinatra::Base

enable :sessions
register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/view' do
    p flash[:invalid].to_s if flash[:invalid]
    @bookmarks = Link.all
    erb :view
  end

  get '/add' do
    erb :add
  end

  post '/adding' do
    flash[:invalid] = "Invalid URL entered." unless Link.add(params[:'link'])
    redirect '/view'
  end

  run! if app_file == $0
end
