# frozen_string_literal: true

require_relative 'card'

class Deck
  SUITS = %w[Hearts Diamonds Clubs Spades].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

  attr_reader :cards

  def initialize
    @cards = build_deck
    shuffle!
  end

  def build_deck
    SUITS.product(RANKS).map { |suit, rank| Card.new(rank, suit) }
  end

  def shuffle!
    cards.shuffle!
  end

  def deal
    cards.pop
  end
end
