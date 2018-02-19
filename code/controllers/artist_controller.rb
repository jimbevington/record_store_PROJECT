# maybe dont' need these
require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/album.rb')
require_relative('../models/artist.rb')

get '/artists/new' do
  erb(:"artists/new")
end

post '/artists' do
  artist = Artist.new(params)
  artist.save()
  redirect to("/artists/#{artist.id}")
end

get '/artists/:id' do
  @artist = Artist.find_by_id(params['id'].to_i)
  @albums = @artist.albums
  erb(:"artists/view")
end
