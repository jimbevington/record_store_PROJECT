# maybe dont' need these
require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/album.rb')
require_relative('../models/artist.rb')


get '/albums/new' do
  erb(:"albums/new")
end

post '/albums' do
  # issue - what happens if the Artist doesn't exist
  artist = Artist.find_by_name(params['artist'])
  params['artist_id'] = artist.id
  album = Album.new(params)
  album.save()
  redirect to("/albums/#{album.id}")
end

get '/albums/:id' do
  @album = Album.find_by_id(params['id'].to_i)
  erb( :"albums/view" )
end

get '/albums/:id/edit' do
  @album = Album.find_by_id(params['id'])
  erb(:"albums/edit")
end

post '/albums/:id/update' do
  album = Album.new(params)
  album.update()
  redirect to("/albums/#{album.id}")
end
