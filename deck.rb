require_relative "card"

class Deck

  attr_accessor :cards

  def initialize
    face = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    suit = %w(Clubs Spades Hearts Diamonds)
    self.cards = []
    suit.each do |suit|
      face.each do |face|
        self.cards << Card.new(face, suit)
      end
    end
  end

  def shuffle
    self.cards.shuffle!
  end

  def draw
    cards.shift
  end

  def empty?
    cards.empty?
  end


end



# test = Deck.new
# puts test.inspect
