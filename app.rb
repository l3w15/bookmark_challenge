require 'sinatra/base'
require './lib/link'
require './lib/database_connection_setup'

class BookmarkManager < Sinatra::Base

  before do
    DatabaseConnection.setup('bookmark_manager_' + ENV['RACK_ENV'])
  end

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
