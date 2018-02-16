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
      url = params[:url]
      title = params[:title]
      Link.add(url, title)
      redirect '/'
    rescue Exception
      flash[:invalid_link] = url
    end
    redirect '/new'
  end

  get '/delete' do
    Link.delete(params[:id])
    redirect('/')
  end

  get '/update' do
    @link = Link.find(params[:id])
    erb(:update)
  end

  post '/update' do
    begin
      url = params[:url]
      title = params[:title]
      Link.update(url, title)
      redirect '/'
    rescue Exception
      flash[:invalid_link] = url
    end
    redirect '/new'
  end

  # run! if app_file == $0
end
