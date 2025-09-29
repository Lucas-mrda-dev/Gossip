require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do # Go to the home page
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new/' do # Create a new potin
    erb :new_gossip
  end

  get '/gossips/:id/' do # Select your potin with an ID
    id_str = params[:id]
    idx = id_str.to_i - 1
    list = Gossip.all

    if idx < 0 || idx >= list.size
      'Potin introuvable'
    else
      g = list[idx]
      erb :show, locals: { gossip: g }
    end
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end
end
