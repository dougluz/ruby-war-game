require_relative '../lib/game.rb'
require_relative '../lib/card.rb'
require_relative '../lib/player.rb'
require_relative '../lib/deck.rb'

RSpec.describe Game do
  let(:game) { Game.new('Douglas', 'Mariana')}

  describe '#initialize' do
    it "creates two players and give then cards" do
      expect(game.player1.name).to eq('Douglas')
      expect(game.player2.name).to eq('Mariana')
      expect(game.player1.hand.size).to eq(26)
      expect(game.player2.hand.size).to eq(26)
    end
  end

  describe '#play_round' do
    it 'moves cards to the winning player' do
      allow(game.player1).to receive(:play_card).and_return(Card.new("10", "Hearts"))
      allow(game.player2).to receive(:play_card).and_return(Card.new("2", "Spades"))

      expect {game.play_round}.to change {game.player1.hand.size}.by(2)
    end

    it 'handles a tie and call war' do
      allow(game.player1).to receive(:play_card).and_return(Card.new("8", "Spades"))
      allow(game.player2).to receive(:play_card).and_return(Card.new("8", "Hearts"))

      expect(game).to receive(:war).and_call_original
      game.play_round
    end
  end

  describe '#game_over?' do
    it "awards all cards in a war to the winning player" do
      tied_cards = [Card.new("8", "Hearts"), Card.new("8", "Spades")]
      allow(game.player1).to receive(:play_war_cards).and_return([Card.new("King", "Diamonds")])
      allow(game.player2).to receive(:play_war_cards).and_return([Card.new("10", "Clubs")])

      expect { game.send(:war, tied_cards) }.to change { game.player1.hand.size }.by(4)
    end

    it "ends the game if a player cannot continue the war" do
      game.player1.hand.clear
      tied_cards = [Card.new("8", "Hearts"), Card.new("8", "Spades")]

      expect { game.send(:war, tied_cards) }.not_to raise_error
      expect(game.game_over?).to eq(true)
    end
  end 
end
