require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/links')
  end

  # show all links(index)
  get '/links' do
    @links = Link.all
    erb(:index)
  end

  # get form for new link
  get '/links/new' do
    erb(:new)
  end

  #adds new link
  post '/links' do
    begin
      url = params[:url]
      title = params[:title]
      Link.add(url, title)
      redirect '/links'
    rescue Exception
      flash[:invalid_link] = url
    end
    redirect '/links/new'
  end

  #deletes links
  post '/links/:id/delete' do
    Link.delete(params[:id])
    redirect('/links')
  end

  #update links form
  get '/links/:id/edit' do
    @link = Link.find(params[:id])
    erb(:update)
  end

  #updates link
  post '/links/:id/update' do
    begin
      url = params[:new_url]
      title = params[:new_title]
      id = params[:id]
      Link.update(url, title, id)
      redirect '/links'
    rescue Exception
      flash[:invalid_update] = "The update did not have a valid url"
    end
    redirect '/'
  end

  # run! if app_file == $0
end
