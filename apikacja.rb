class Apikacja < Sinatra::Base
    get '/' do
        "Hello world!"
    end
end