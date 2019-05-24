# Advanced advanced extension!!!

require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class KaraokeBarTest < MiniTest::Test

  def setup
    @room_1 = Room.new("Rock_room", "Rock", 5, 2)

    @guest_1 = Guest.new("Steve", 10)
    @guest_2 = Guest.new("Roisin", 15)
    @guest_3 = Guest.new("Andrew", 20)

    @karaoke_bar = KaraokeBar.new("Gino's")
  end

  def test_name
    assert_equal("Gino's", @karaoke_bar.name)
  end

  def test_bar_till
    assert_equal(0, @karaoke_bar.till)
  end

  def test_till_increase
    @karaoke_bar.guest_pays(@room_1)
    assert_equal(2, @karaoke_bar.till)
  end


end
