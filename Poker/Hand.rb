require_relative 'Card.rb'
require_relative 'Deck.rb'

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  HAND_RANKS = {
    :straight_flush => 1,
    :four_of_a_kind => 2,
    :full_house => 3,
    :flush => 4,
    :straight => 5,
    :three_of_a_kind => 6,
    :two_pair => 7,
    :one_pair => 8,
    :high_card => 9
  }

  def determine_rank
    HAND_RANKS[determine_hand]
  end

  def determine_hand
    if straight_flush?
      :straight_flush
    elsif four_of_a_kind?
      :four_of_a_kind
    elsif full_house?
      :full_house
    elsif flush?
      :flush
    elsif straight?
      :straight
    elsif three_of_a_kind?
      :three_of_a_kind
    elsif two_pair?
      :two_pair
    elsif one_pair?
      :one_pair
    else
      :high_card
    end
  end

  def display_hand
    @cards.each do |card|
      print "#{card.suit}:#{card.value}  "
    end
  end


  private

  def staight_flush?
    return false unless flush? && straight?
    true
  end

  def four_of_a_kind?
    val1 = cards.values[0]
    count1 = cards.values.count(val1)
    val2 = cards.values[1]
    count2 = cards.values.count(val2)
    return false unless count1 == 4 || count2 == 4
    true
  end

  def full_house?
    return false unless one_pair? && three_of_a_kind?
    true
  end

  def flush?
    suit = cards[0].suit
    return false unless cards.suit.all?{ |s| suit == s }
    true
  end

  def straight?
    sorted_values = cards.values.sort
    return false unless sorted_values[0] == (sorted_values[4] - 4)
    true
  end

  def three_of_a_kind?
    c_vals= cards.values
    return false unless c_vals.any? {|val| c_vals.count(val) == 3}
    true
  end

  def two_pair?
    c_vals= cards.values
    return false unless c_vals.uniq.count == 3
    true
  end

  def one_pair?
    c_vals= cards.values
    return false unless c_vals.uniq.count == 4
    true
  end

end


if __FILE__ == $PROGRAM_NAME

deck = Deck.new
deck.populate
hand = Hand.new(deck.cards[0..4])
hand.display_hand

end
