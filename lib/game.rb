# frozen_string_literal: true

require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :player1, :player2

  def initialize(player1_name, player2_name)
    deck = Deck.new
    half = (deck.cards.size / 2) - 1

    @player1 = Player.new(player1_name, deck.cards[0..half])
    @player2 = Player.new(player2_name, deck.cards[(half+1)..])
  end

  def play
    play_round until game_over?
    declare_winner
  end

  def play_round
    player1_card = player1.play_card
    player2_card = player2.play_card

    puts "#{player1.name} #{player1.hand.size}"
    puts "#{player2.name} #{player2.hand.size}"

    puts "#{player1.name} plays #{player1_card}"
    puts "#{player2.name} plays #{player2_card}"

    if card_value(player1_card) > card_value(player2_card)
      player1.add_cards([player1_card, player2_card])
      puts "#{player1.name} wins"
    elsif card_value(player2_card) > card_value(player1_card)
      player2.add_cards([player1_card, player2_card])
      puts "#{player2.name} wins"
    else
      war([player1_card, player2_card])
    end
  end

  def war(table_cards = [])
    if game_over?
      declare_winner
      return
    end

    hand_size = get_war_hand_size
    puts hand_size
    player1_cards = player1.play_war_cards(hand_size)
    player2_cards = player2.play_war_cards(hand_size)
    tied_cards = player1_cards + player2_cards + table_cards
    puts tied_cards
    player1_cards.each_with_index do |card, index|
      player1_card_value = card_value(card)
      player2_card_value = card_value(player2_cards[index])

      if player1_card_value > player2_card_value
        puts "#{player1.name} wins the war"
        return player1.add_cards(tied_cards)
      elsif player1_card_value < player2_card_value
        puts "#{player2.name} wins the war"
        return player2.add_cards(tied_cards)
      else
        puts 'war draw'
      end
    end

    war(tied_cards)
  end

  def get_war_hand_size
    return 3 if players_smaller_hand_size >= 3

    players_smaller_hand_size
  end

  def players_smaller_hand_size
    [player1.hand.size, player2.hand.size].min
  end

  def card_value(card)
    Deck::RANKS.index(card.rank)
  end

  def game_over?
    player1.hand.empty? || player2.hand.empty?
  end

  def declare_winner
    if player1.hand.empty?
      puts "#{player2.name} wins the game!"
    elsif player2.hand.empty?
      puts "#{player1.name} wins the game!"
    end
  end
end
