require_relative "card"

class Deck
  SUITS = %w[Hearts Diamonds Clubs Spades]
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]

  attr_reader :cards

  def initialize
    @cards = build_deck
    suffle!
  end

  def build_deck
    SUITS.product(RANKS).map { |suit, rank| Card.new(rank, suit) }
  end

  def suffle!
    cards.suffle!
  end

  def deal
    cards.pop
  end
end
