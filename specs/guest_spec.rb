require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Steve", 10)
    # @guest_2 = Guest.new("Roisin")
    # @guest_3 = Guest.new("Andrew")
    # @guest_4 = Guest.new("Ben")
    # @guest_5 = Guest.new("Gillian")
    # @guest_6 = Guest.new("Katie")
  end

  def test_name
    assert_equal("Steve", @guest_1.name)
  end

  def test_wallet
    assert_equal(10, @guest_1.wallet)
  end

  def test_guest_is_happy
    assert_equal("Woo, this is my jam!", @guest_1.happy)
  end
end
