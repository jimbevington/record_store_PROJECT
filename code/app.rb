require('sinatra')
require('sinatra/contrib/all')

require_relative('models/album.rb')
require_relative('models/artist.rb')
require_relative('controllers/album_controller.rb')
require_relative('controllers/artist_controller.rb')

# CSS class names for styling of Stock Levels
$stock_style_classes = {
  'high' => "green_tr",
  'medium' => "amber_tr",
  'low' => "red_tr",
  'out of stock' => "grey_tr"
}


get '/' do
  @albums = Album.all()
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
  # get albums with search term
  @albums = Album.search(params['term'])
  # get artists with search term
  artists = Artist.search(params['term'])
  # get the albums of found artists
  artist_albums = artists.map{|artist| artist.albums()}
  artist_albums.flatten! # flatten to single array
  artist_albums.uniq! # remove duplicates
  # add the albums by artist name to the @albums []
  artist_albums.each{|album| @albums.push(album)}
  erb(:search_results)
end

post '/inventory/filter' do
  @stock_level = params['stock_level']
  @albums = Album.all()
  erb(:filtered_results)
end
