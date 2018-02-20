require('sinatra')
require('sinatra/contrib/all')

require_relative('models/album.rb')
require_relative('models/artist.rb')
require_relative('controllers/album_controller.rb')
require_relative('controllers/artist_controller.rb')

$stock_style_classes = {'high' => "green_tr",
                   'medium' => "amber_tr",
                   'low' => "red_tr",
                 'out of stock' => "grey_tr"}

get '/' do
  erb(:index)
end

post '/inventory' do
  @albums = Album.all_order_by(params['field'])
  erb(:inventory)
end

get '/inventory' do
  @albums = Album.all()
  erb(:inventory)
end

get '/inventory/out_of_stock' do
  @albums = Album.all()
  erb(:out_of_stock)
end

post '/inventory/search' do
  @albums = Album.search(params['term'])
  erb(:search_results)
end
