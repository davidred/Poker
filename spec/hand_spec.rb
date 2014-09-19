require 'rspec'
require 'hand'
require 'card'

describe Hand do
  subject(:hand) { Hand.new }
  let(:cards) do
    [ Card.new(:hearts, :four),
      Card.new(:hearts, :five),
      Card.new(:clubs, :six),
      Card.new(:diamonds, :five),
      Card.new(:hearts, :six) ]
  end

  let(:deck) { double("deck") }

  context "Player is dealt a hand" do



    it "should contain 5 cards" do
      deck.should_receive(:deal).with(5).and_return(cards)
      hand = Hand.new(deck.deal(5))
      expect(hand.cards.count).to eq(5)
    end

    it "should raise and error when not created with card objects" do
      bad_cards = Array.new(5,4)
      deck.should_receive(:deal).with(5).and_return(bad_cards)
      expect{ Hand.new(deck.deal(5)) }.to raise_error("Not an array of card objects")
    end


  it "Should be able to take cards from deck" do
    deck.should_receive(:deal).with(5).and_return(cards)
    expect(hand.take_cards(deck, 5).cards.count).to eq(5)
  end

  it "Should be able to return cards to deck" do
    deck.should_receive(:return).with([cards[0], cards[1]])
    deck.stub(:deal).with(5).and_return(cards)

    hand.take_cards(deck, 5)
    hand.return(deck, [cards[0], cards[1]])
  end

  it "Should be able to replace cards" do

    hand = Hand.new(cards.dup)
    hand.should_receive(:take_cards).with(deck, 3)
    hand.should_receive(:return).with(deck, [cards[0], cards[1], cards[3]])
    deck.stub(:return)
    deck.stub(:deal).and_return([])
    hand.replace(deck, [0,1,3])
    expect(hand.cards).to_not include(cards[0], cards[1], cards[3])
  end

  it "should calulate hand type"

  it "should compare with other hands"
end

end
