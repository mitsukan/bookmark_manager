require 'sinatra'
require './lib/link.rb'

class Bookmark_Manager < Sinatra::Base

  get '/' do
    @bookmark = Link.all
    erb :index
  end



  run! if app_file == $0
end
