# frozen_string_literal: true

class Deck
  def initialize
    @cards = []
    SUITS.each { |suit| VALUES.each { |value| @cards << Card.new(value, suit) } }
  end

  def give_random_card
    cards.delete(cards.sample)
  end

  private

  SUITS = %w[♠ ♣ ♥ ♦].freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  attr_accessor :cards
end
