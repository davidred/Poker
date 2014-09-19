require_relative 'card'
require_relative 'deck'

class Hand

  attr_reader :cards

  def initialize(cards = [])

    raise "Not an array of card objects" unless cards.all? do |card|
      card.is_a?(Card)
    end

    @cards = cards
  end

  def take_cards(deck, num)
    @cards.concat(deck.deal(num))
    self
  end

  def return(deck, cards)
    deck.return(cards)
  end

  def replace(deck, cards_index)
    return_cards = []
    cards_index.each do |index|
      return_cards << cards[index]
    end
    return_cards.each { |i| self.cards.delete_if{|card| card == i } }
    self.return(deck, return_cards)
    p "calling take cards"
    self.take_cards(deck, return_cards.count)

  end
end