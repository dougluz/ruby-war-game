require_relative "../lib/deck.rb"

RSpec.describe Deck do
  let(:deck) { Deck.new }
  describe '#initialize' do
    it "creates a new deck with all 52 cards" do
      expect(deck.cards.size).to eq(52)
    end
  end
  
  describe 'shuffle!' do
    it 'shuffles the cards correctly' do
      original_deck = deck.cards.dup
      deck.shuffle!

      expect(deck.cards).not_to eq(original_deck)
    end
  end

  describe '#deal' do
    it 'remove the correct card from the deck' do
      top_card = deck.cards.last
      dealt_card = deck.deal

      expect(dealt_card).to eq(top_card)
      expect(deck.cards.size).to eq(51)
    end
  end
end
