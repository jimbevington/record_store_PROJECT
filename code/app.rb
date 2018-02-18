require('sinatra')
require('sinatra/contrib/all')

require_relative('models/album.rb')
require_relative('models/artist.rb')
require_relative('controllers/album_controller.rb')
require_relative('controllers/artist_controller.rb')

get '/' do
  erb(:index)
end

# NOT DONE YET
get '/inventory' do
  @albums = Album.all()
  erb(:inventory)
end