require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < MiniTest::Test

  def setup

# song has a title, artist, genre
    @song_1 = Song.new("Bohemian Rhapsody", "Queen", "Rock")

# guest has a name and wallet
    @guest_1 = Guest.new("Steve", 10)
    @guest_2 = Guest.new("Roisin", 15)
    @guest_3 = Guest.new("Andrew", 20)
    @guest_4 = Guest.new("Ben", 50)
    @guest_5 = Guest.new("Gillian", 5)
    @guest_6 = Guest.new("Katie", 1)

# a room has a name, genre, till and a fee
    @room_1 = Room.new("Rock_room", "Rock", 5, 2)
    # @room_2 = Room.new("Pop_room", "Pop")
  end

  def test_name
    assert_equal("Rock_room", @room_1.name)
  end

  def test_genre
    assert_equal("Rock", @room_1.genre)
  end

  def test_check_in_guest
    @room_1.check_in_guest(@guest_1)
    assert_equal([@guest_1], @room_1.guests)
  end

  def test_room_capacity
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_in_guest(@guest_3)
    assert_equal(3, @room_1.guests.count)
  end

  def test_check_out_guest
    @room_1.check_out_guest(@guest_1)
    assert_equal(0, @room_1.guests.count)
  end

  def test_add_song
    @room_1.add_song_to_playlist(@song_1)
    assert_equal([@song_1], @room_1.playlist)
  end

  def test_capacity
    assert_equal(5, @room_1.capacity)
  end

  def test_capacity__reached
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_in_guest(@guest_3)
    @room_1.check_in_guest(@guest_4)
    @room_1.check_in_guest(@guest_5)
    assert_equal("Sorry, that room is full. Please choose another.", @room_1.check_in_guest(@guest_6))
  end

  def test_till
    assert_equal(0, @room_1.till)
  end

  def test_room_fee
    assert_equal(2, @room_1.fee)
  end

  def test_check_in_guest__wallet_decrease
    @room_1.check_in_guest(@guest_1)
    assert_equal(8, @guest_1.wallet)
  end

  def test_check_in_guest__and_till_increase
    @room_1.check_in_guest(@guest_1)
    assert_equal(8, @guest_1.wallet)
    assert_equal(2, @room_1.till)
  end

  def test_guest_cant_afford
    assert_equal("There's a bank machine round the corner", @room_1.check_in_guest(@guest_6) )
  end

end
