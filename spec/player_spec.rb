require_relative '../lib/player.rb'
require_relative '../lib/deck.rb'

RSpec.describe Player do
  let(:deck) { Deck.new }
  let(:player) { Player.new("Douglas", deck.cards) }
  describe '#initialize' do
    it 'creates a player with the correct name' do
      expect(player.name).to eq("Douglas")
    end

    it 'creates player hand with received cards' do
      expect(player.hand.size).to eq(52)
    end
  end

  describe '#play_card' do
    it 'plays the player first card and removes from hand' do
      first_card = player.hand.first
      played_card = player.play_card

      expect(played_card).to eq(first_card)
      expect(player.hand.size).to eq(51)
    end
  end

  describe '#add_cards' do
    it 'adds the right amount of cards in the hand of the player' do
      played_card = player.play_card

      expect(player.hand.size).to eq(51)
      player.add_cards([played_card])
      expect(player.hand.size).to eq(52)
      expect(player.hand.last).to eq(played_card)
    end
  end

  describe '#play_war_cards' do
    it 'returns the default amount of cards' do
      war_cards = player.play_war_cards
      expect(war_cards.size).to eq(3)
    end

    it 'returns the number of cards received in the args' do
      war_cards = player.play_war_cards(10)
      expect(war_cards.size).to eq(10)
    end
  end
end
