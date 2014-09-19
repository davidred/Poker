class Card

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  attr_reader :suit, :value

  # Returns an array of all suits.
   def self.suits
     SUIT_STRINGS.keys
   end

   # Returns an array of all values.
   def self.values
     VALUE_STRINGS.keys
   end

  def initialize(suit, value)
    unless Card.suits.include?(suit) and Card.values.include?(value)
      raise "illegal suit (#{suit}) or value (#{value})"
    end

    @suit, @value = suit, value
  end

  def to_s
    "#{VALUE_STRINGS[value]} of #{SUIT_STRINGS[suit]}'s"
  end

  def ==(other_card)
    return false if other_card.nil?
    self.suit == other_card.suit && self.value == other_card.value
  end

  def >(other_card)
    suits = [:clubs, :diamonds, :hearts, :spades]
    values = [:deuce, :three, :four, :five, :six, :seven,
      :eight, :nine, :ten, :jack, :queen, :king, :ace]
      if suits.index(self.suit) > suits.index(other_card.suit)
        true
      elsif suits.index(self.suit) < suits.index(other_card.suit)
        false
      else
        values.index(self.value) > values.index(other_card.value)
      end
    end


  def <=>(other_card)
    return 0 if self == other_card
    return -1 if other_card > self
    1
  end


end