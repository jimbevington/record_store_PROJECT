# maybe dont' need these
require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/album.rb')
require_relative('../models/artist.rb')


get '/albums/new' do
  erb(:"albums/new")
end

post '/albums' do
  artist_id = Artist.find_by_name(params('artist')).id
  album = Album.new(params)
  album.save()
  redirect to("/albums/#{album.id}")
end

get '/albums/:id' do
  @album = Album.find_by_id(params['id'].to_i)
  erb( :"albums/view" )
end
