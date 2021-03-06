require './environment'

module FormsLab
  class App < Sinatra::Base
    # code other routes/actions here

    get '/' do
      erb :root
    end

    get '/new' do
      @pirate = Pirate.all
      erb :"pirates/new"
    end

    # get '/pirates' do
    #   @pirate = Pirate.all
    #   erb :'pirates/show'
    # end
    # get '/show' do
    #   erb :'pirates/show'
    # end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end
