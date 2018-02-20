require('sinatra')
require('sinatra/contrib/all')

require_relative('models/album.rb')
require_relative('models/artist.rb')
require_relative('controllers/album_controller.rb')
require_relative('controllers/artist_controller.rb')

get '/' do
  erb(:index)
end

post '/inventory' do
  @stock_style_classes = {'high' => "green_tr",
                     'medium' => "amber_tr",
                     'low' => "red_tr"}
  @albums = Album.all_order_by(params['field'])
  erb(:inventory)
end

get '/inventory' do
  @stock_style_classes = {'high' => "green_tr",
                     'medium' => "amber_tr",
                     'low' => "red_tr"}
  @albums = Album.all()
  erb(:inventory)
end
