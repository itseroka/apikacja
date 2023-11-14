class Apikacja < Sinatra::Base
    get '/' do
         # ---database---
        file = File.read('./data.json')
        @items = JSON.parse(file)
        
        # ---current BTC price---
        response_btc = HTTParty.get('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd')
        data_btc = JSON.parse(response_btc.body)
        bitcoin_price = data_btc['bitcoin']['usd']

        # ---halving---
        btc_blocks = HTTParty.get('https://api.blockchair.com/bitcoin/stats')
        data_blocks = JSON.parse(btc_blocks.body)
        block = data_blocks["data"]["blocks"]
        last_blocks = data_blocks["data"]["blocks_24h"]
        halving = 840000
        deadline = halving - block
        countdown = deadline / last_blocks
        @countdown = countdown.floor
        @final_countdown = Time.now + countdown * 24 * 60 * 60
        @final_countdown = @final_countdown.strftime("%d-%m-%Y")
                
        # ---largest transaction---
        largest_transaction = data_blocks["data"]["largest_transaction_24h"]["value_usd"]

        # ---class/method---
        beautiful_number = Number.new
        @beautiful_number = beautiful_number.format_number(largest_transaction)
        @bitcoin_price = beautiful_number.format_number(bitcoin_price)
        
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