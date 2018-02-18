require('minitest/autorun')
require('minitest/rg')

require_relative('../models/album.rb')
require_relative('../models/artist.rb')

class TestAlbum < MiniTest::Test

  def setup
    @artist = Artist.new({
      'id' => 1,
      'name' => 'The Fall'
    })
    @album = Album.new({
      'title' => 'This Nations Saving Grace',
      'artist_id' => @artist.id,
      'quantity' => 25
    })
  end

  def test_album_parameters
    assert_equal('This Nations Saving Grace', @album.title)
    assert_equal(1, @album.artist_id)
    assert_equal(25, @album.quantity)
  end


end
