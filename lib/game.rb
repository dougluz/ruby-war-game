require_relative "deck"
require_relative "player"

class Game
  attr_reader :player1, :player2

  def initialize(player1_name, player2_name)
    deck = Deck.new
    half = deck.cards.size / 2

    @player1 = Player.new(player1_name, deck.cards[0..half])
    @player2 = Player.new(player2_name, deck.cards[half..])
  end 

  def play
    until player1.hand.empty? || player2.hand.empty?
      play_round
    end

    declare_winner
  end

  def play_round
    player1_card = player1.play_card
    player2_card = player2.play_card 

    puts "#{player1.name} plays #{player1_card}"
    puts "#{player2.name} plays #{player2_card}"

    if card_value(player1_card) > card_value(player2_card)
      player1.add_cards([player1_card, player2_card])
      puts "#{player 1} wins"
    elseif card_value(player2_card) > card_value(player1_card)
     player2.add_cards([player1_card, player2_card])
    else 
      puts "war"
    end
  end

  def resolve_tie
  end

  def card_value(card)
    Deck::RANKS.index(card.rank)
  end

  def declare_winner
    if player1.hand.empty?
      puts "#{player2.name} wins the game!"
    elseif player2.hand.empty?
      puts "#{player1.name} wins the game!"
    end
  end
end


