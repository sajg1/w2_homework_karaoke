require('pry')
class Room

  attr_reader :name, :genre, :capacity, :fee
  attr_accessor :guests, :playlist, :till

  def initialize(name, genre, capacity, fee)
    @name = name
    @genre = genre
    @fee = fee
    @guests = []
    @capacity = capacity
    @playlist = []
    @till = 0

  end

  def check_in_guest(guest)
    if (@guests.count == @capacity)
      return "Sorry, that room is full. Please choose another."
    elsif (guest.wallet < @fee)
      return "There's a bank machine round the corner"
    else
      @guests << guest
      guest.wallet -= @fee
      @till =+ @fee
    end
  end

  def check_out_guest(guest)
    for guest_in_room in @guests
      if guest_in_room == guest
        person.remove
      end
    end
  end

  def add_song_to_playlist(song)
    @playlist << song
  end


end
