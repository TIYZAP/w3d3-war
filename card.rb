class Card

  attr_accessor :suit, :face, :value

  def initialize(face, suit)
    self.face = face
    self.suit = suit
    card_value
  end

  def card_value
    if face == "Ace"
      self.value = 14
    elsif face == "King"
      self.value = 13
    elsif face == "Queen"
      self.value = 12
    elsif face == "Jack"
      self.value = 11
    else
      self.value = face.to_i
    end
  end

  def > (other)
    value.to_i > other.value.to_i
  end

  def < (other)
    value.to_i < other.value.to_i
  end




end
