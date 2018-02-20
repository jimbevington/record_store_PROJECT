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
  @artist = params['artist']
  artist = Artist.find_by_name(params['artist'])
  unless artist == nil
    params['artist_id'] = artist.id
    album = Album.new(params)
    album.save()
    redirect to("/albums/#{album.id}")
  else
    erb(:"albums/no_artist")
  end
end

get '/albums/:id' do
  @album = Album.find_by_id(params['id'].to_i)
  erb( :"albums/view" )
end

get '/albums/:id/edit' do
  @album = Album.find_by_id(params['id'])
  @artist = Artist.find_by_id(@album.artist_id)
  erb(:"albums/edit")
end

post '/albums/:id/update' do
  artist = Artist.find_by_name(params['artist'])
  params['artist_id'] = artist.id
  album = Album.new(params)
  album.update()
  redirect to("/albums/#{album.id}")
end

get '/albums/:id/delete_are_you_sure' do
  @album = Album.find_by_id(params['id'])
  erb(:"albums/delete_are_you_sure")
end

post '/albums/:id/delete' do
  album = Album.find_by_id(params['id'])
  album.delete()
  redirect to('/inventory')
end
