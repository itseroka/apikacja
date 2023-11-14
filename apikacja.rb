class Apikacja < Sinatra::Base
    get '/' do
        erb :index
    end

    post '/item' do
        # stwórz
    end

    post '/edit' do
        # edytuj
    end

    delete '/:id' do
        # usuń
    end
end