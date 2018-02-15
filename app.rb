require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/' do
    begin
      new_link = params[:new_link]
      Link.add(new_link)
      redirect '/'
    rescue Exception
      flash[:invalid_link] = new_link
    end
    redirect '/new'
  end

  # run! if app_file == $0
end
