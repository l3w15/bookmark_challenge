require 'sinatra/base'
require_relative 'lib/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/' do
    @new_link = params[:new_link]
    Link.add(@new_link)
    redirect '/'
  end

  # run! if app_file == $0
end
