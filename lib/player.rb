class Player 
  attr_reader :name, :hand

  def initialize(name, hand = [])
    @name = name
    @hand = hand
  end

  def play_card
    hand.shift
  end

  def play_war_cards(quantity = 3)
    return hand.shift(quantity)
  end

  def add_cards(cards)
    hand.concat(cards)
  end
end
