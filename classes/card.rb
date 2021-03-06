# frozen_string_literal: true

class Card
  attr_accessor :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
    @score = 0
  end

  def to_s
    value + suit
  end

end
