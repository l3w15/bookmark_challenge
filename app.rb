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
      url = params[:new_url]
      title = params[:new_title]
      id = params[:id]
      Link.update(url, title, id)
      redirect '/'
    rescue Exception
      flash[:invalid_update] = "The update did not have a alid url"
    end
    redirect '/'
  end

  # run! if app_file == $0
end
