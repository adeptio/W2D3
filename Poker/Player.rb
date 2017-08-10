require 'byebug'
require_relative 'Hand.rb'

class Player
  def initialize(name = 'P1', pot, hand)
    @name = name
    @pot = pot
    @hand = hand
  end

  def get_discard
    discard_input = true
    while discard_input
      puts "Which cards would you like to discard?"
      @hand.display_hand

      discard = gets.chomp
      break if discard.nil?

      card_suit = discard.split(":")[0].to_sym
      card_val = discard.split(":")[1].to_i

      @hand.cards.delete_if { |card| card.suit == card_suit && card_val == card.value }
    end
  end

  def fold?
  end

  def see?
  end

  def raise?
  end

end


if __FILE__ == $PROGRAM_NAME

deck = Deck.new
deck.populate
handy = Hand.new(deck.cards[0..4])
player = Player.new('Jesse', 4000000, handy)


player.get_discard

end
