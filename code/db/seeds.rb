require('pry')

require_relative('../models/album.rb')
require_relative('../models/artist.rb')

# delete all the artists prior to loading
Artist.delete_all()


artist1 = Artist.new({
  'name' => 'The Fall'
})
artist2 = Artist.new({
  'name' => 'Oneohtrix Point Never'
})
artist3 = Artist.new({
  'name' => 'Jimi Hendrix'
})
artist4 = Artist.new({
  'name' => 'Christian Scott'
})
artist5 = Artist.new({
  'name' => 'Vince Staples'
})

artists = [artist1, artist2, artist3, artist4, artist5]
artists.each{|artist| artist.save()}

# Test Artist update function
artist1.name = 'Mark E Smith'
artist1.update()
# Revert to Original
artist1.name = 'The Fall'
artist1.update()

album1 = Album.new({
  'title' => 'This Nations Saving Grace',
  'artist_id' => artist1.id,
  'genre' => 'Post Punk',
  'quantity' => 25,
  'buy_price' => 4,
  'sell_price' => 10
})
album2 = Album.new({
  'title' => 'Fall Heads Roll',
  'artist_id' => artist1.id,
  'genre' => 'Post Punk',
  'quantity' => 15,
  'buy_price' => 5,
  'sell_price' => 10
})
album3 = Album.new({
  'title' => 'Garden of Delete',
  'artist_id' => artist2.id,
  'genre' => 'Electronic',
  'quantity' => 10,
  'buy_price' => 5,
  'sell_price' => 11
})
album4 = Album.new({
  'title' => 'Returnal',
  'artist_id' => artist2.id,
  'genre' => 'Vaporwave',
  'quantity' => 18,
  'buy_price' => 3,
  'sell_price' => 9
})
album5 = Album.new({
  'title' => 'R Plus Seven',
  'artist_id' => artist2.id,
  'genre' => 'Electronic',
  'quantity' => 35,
  'buy_price' => 4,
  'sell_price' => 8
})
album6 = Album.new({
  'title' => 'Cry of Love',
  'artist_id' => artist3.id,
  'genre' => 'Rock',
  'quantity' => 12,
  'buy_price' => 8,
  'sell_price' => 15
})
album7 = Album.new({
  'title' => 'Stretch Music',
  'artist_id' => artist4.id,
  'genre' => 'Jazz',
  'quantity' => 5,
  'buy_price' => 7,
  'sell_price' => 14
})
album8 = Album.new({
  'title' => 'Yesterday You Said Tomorrow',
  'artist_id' => artist4.id,
  'genre' => 'Jazz',
  'quantity' => 26,
  'buy_price' => 4,
  'sell_price' => 12
})
album9 = Album.new({
  'title' => 'Ramona Park',
  'artist_id' => artist5.id,
  'genre' => 'Hip Hop',
  'quantity' => 45,
  'buy_price' => 3,
  'sell_price' => 11
})
album10 = Album.new({
  'title' => 'Summertime \'06',
  'artist_id' => artist5.id,
  'genre' => 'Hip Hop',
  'quantity' => 34,
  'buy_price' => 3,
  'sell_price' => 10
})

albums = [album1, album2, album3, album4, album5, album6, album7, album8, album9, album10]
# save all the albums
albums.each{|album| album.save()}



binding.pry
nil
