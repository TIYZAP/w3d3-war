require_relative "card"
require_relative "deck"


class Game

include Comparable

  attr_accessor :p1_hand, :p2_hand, :p1_score, :p2_score, :rounds, :wars

  def initialize
    puts "I Declare War!!! --- whoever has the most cards wins!"
    self.p1_score = []
    self.p2_score = []
    self.rounds = 0
    self.wars = 0
    self.p1_hand = Deck.new
    self.p2_hand = Deck.new
    p1_hand.shuffle
    p2_hand.shuffle
  end

  def play
      until p1_hand.empty? || p2_hand.empty?

       battle
      end

    final_score
    puts "Would you like a rematch? (y/n)"

    if re_match = gets.chomp.downcase == "y"
      initialize
      play
    else
      puts "Thank you for playing :)"
    end
  end

  def battle
    self.rounds += 1
    # self.rounds = self.rounds + 1
    # puts "Round #{self.rounds}! Declare War!"
    p1_card = p1_hand.draw
    p2_card = p2_hand.draw
  
    if p1_card > p2_card
      p1_score << p1_card
      p1_score << p2_card
    elsif p2_card > p1_card
      p2_score << p2_card
      p2_score << p1_card
    else
      self.wars += 1
      # self.wars = self.wars + 1
      # puts "I will show you the meaning of war!"
    end
  end

  def final_score
    if p1_score.count > p2_score.count
      puts "Player 1 won this game after a score of #{p1_score.length} - #{p2_score.length} and survived #{wars} WARs!"
    else
      puts "Player 2 won this game after a score of #{p2_score.length} - #{p1_score.length} and survived #{wars} WARs!"
    end
  end
end

game = Game.new
game.play
