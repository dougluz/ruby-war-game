class Player 
  attr_reader :name, :hand

  def initialize(name, hand = [])
    @name = name
    @hand = hand
  end

  def play_card
    hand.shift
  end

  def add_cards(cards)
    hand.concat(cards)
  end
end
