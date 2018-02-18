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
  'quantity' => 25
})
album2 = Album.new({
  'title' => 'Fall Heads Roll',
  'artist_id' => artist1.id,
  'quantity' => 15
})
album3 = Album.new({
  'title' => 'Garden of Delete',
  'artist_id' => artist2.id,
  'quantity' => 10
})
album4 = Album.new({
  'title' => 'Returnal',
  'artist_id' => artist2.id,
  'quantity' => 18
})
album5 = Album.new({
  'title' => 'R Plus Seven',
  'artist_id' => artist2.id,
  'quantity' => 35
})
album6 = Album.new({
  'title' => 'Cry of Love',
  'artist_id' => artist3.id,
  'quantity' => 12
})
album7 = Album.new({
  'title' => 'Stretch Music',
  'artist_id' => artist4.id,
  'quantity' => 5
})
album8 = Album.new({
  'title' => 'Yesterday You Said Tomorrow',
  'artist_id' => artist4.id,
  'quantity' => 26
})
album9 = Album.new({
  'title' => 'Ramona Park',
  'artist_id' => artist5.id,
  'quantity' => 45
})
album10 = Album.new({
  'title' => 'Summertime \'06',
  'artist_id' => artist5.id,
  'quantity' => 34
})

albums = [album1, album2, album3, album4, album5, album6, album7, album8, album9, album10]
# save all the albums
albums.each{|album| album.save()}



binding.pry
nil
