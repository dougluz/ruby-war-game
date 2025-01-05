require_relative '../lib/card.rb'

RSpec.describe Card do
  describe "#initialize" do
    it 'sets the rank and suit correctly' do
      card = Card.new("Ace", "Spades")

      expect(card.rank).to eq("Ace")
      expect(card.suit).to eq("Spades")
    end
  end

  describe '#to_s' do
    it 'returns the card as a string' do
      card = Card.new("Ace", "Spades")

      expect(card.to_s).to eq("Ace of Spades")
    end
  end
end
