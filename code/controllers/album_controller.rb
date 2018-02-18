# maybe dont' need these
require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/album.rb')
require_relative('../models/artist.rb')

get '/albums/:id' do
  @album = Album.find_by_id(params['id'].to_i)
  erb( :"albums/view" )
end
