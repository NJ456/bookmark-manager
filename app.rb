require 'sinatra'
require './lib/bookmarks'
class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello World!"
  end

  get'/bookmarks' do
    @bookmarks = Bookmarks.all
      erb :index
  end

  get '/form' do
    erb :form
  end

 post '/bookmarks' do
  @url = params[:url]
  Bookmarks.add(@url)
  redirect('/bookmarks')
 end



end
