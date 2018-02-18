require('pry')

require_relative('../models/album.rb')
require_relative('../models/artist.rb')

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
