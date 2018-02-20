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
  @stock_style_classes = {'high' => "green_tr",
                     'medium' => "amber_tr",
                     'low' => "red_tr"}
  @artist = Artist.find_by_id(params['id'].to_i)
  @albums = @artist.albums
  erb(:"artists/view")
end

get '/artists/:id/edit' do
  @artist = Artist.find_by_id(params['id'])
  erb(:"artists/edit")
end

post '/artists/:id/update' do
  artist = Artist.new(params)
  artist.update()
  redirect to("/artists/#{artist.id}")
end

get '/artists/:id/delete_are_you_sure' do
  @artist = Artist.find_by_id(params['id'])
  erb(:"artists/delete_are_you_sure")
end

post '/artists/:id/delete' do
  artist = Artist.find_by_id(params['id'])
  artist.delete()
  # go HOME
  redirect to('/inventory')
end
