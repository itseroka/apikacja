class Apikacja < Sinatra::Base
    get '/' do
        file = File.read('./data.json')
        @items = JSON.parse(file)
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