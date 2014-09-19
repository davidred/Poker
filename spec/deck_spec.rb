require 'rspec'
require 'deck'
require 'card'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#all_cards" do
    it 'Returns 52 cards' do
      expect(deck.all_cards.count).to eq(52)
    end

    it 'Returns a sorted array' do
      expect(deck.all_cards.first).to eq(Card.new(:clubs, :deuce))
      expect(deck.all_cards.last).to eq(Card.new(:spades, :ace))
      expect(deck.all_cards[22]).to eq(Card.new(:diamonds, :jack))
    end
  end

  it 'Shuffles the deck' do
    deck.shuffle
    expect(deck.deal(2)).to_not eq([Card.new(:clubs, :deuce),Card.new(:clubs, :three)])
  end

  it 'It deals cards from the top of the deck' do
    expect(deck.deal(2)).to eq([Card.new(:clubs, :deuce),Card.new(:clubs, :three)])
  end

  it 'Returns to the bottom of the deck' do
    deck.return(deck.deal(2))
    expect(deck.all_cards.count).to eq(52)
    expect(deck.deal(2)).to_not match_array([Card.new(:clubs, :deuce),Card.new(:clubs, :three)])
  end

end
