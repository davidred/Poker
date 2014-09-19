class Deck

  def initialize(num_decks = 1)
    @num_decks = num_decks
    deck = []

    num_decks.times do
      deck += create_deck
    end

    @cards = deck
  end

  def all_cards
    @cards.sort {|card, other_card| card <=> other_card}
  end

  def deal(n)
    @cards.shift(n)
  end

  def shuffle
    @cards.shuffle!
  end

  def return(used_cards)
    @cards += used_cards
  end

  private

  def create_deck
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

end