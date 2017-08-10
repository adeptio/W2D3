require_relative 'Card.rb'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
  end

  SUITS = [:clubs, :spades, :hearts, :diamonds]
  VALUES = (2..14).to_a

  def populate
    VALUES.each do |value|
      SUITS.each do |suit|
        @cards << Card.new(suit, value)
      end
    end
    nil
  end

  def shuffle!
    cards.shuffle!
  end

end
