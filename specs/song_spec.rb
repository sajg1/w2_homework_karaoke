require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < MiniTest::Test

  def setup
    @song_1 = Song.new("Bohemian Rhapsody", "Queen", "Rock")
  end

  def test_name
    assert_equal("Bohemian Rhapsody", @song_1.name)
  end

  def test_artist
    assert_equal("Queen", @song_1.artist)
  end

  def test_genre
    assert_equal("Rock", @song_1.genre)
  end
end
