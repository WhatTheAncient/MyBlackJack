# frozen_string_literal: true

class Card
  attr_accessor :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    value + suit
  end

  def score
    @score ||= begin
      return 11 if ace?
      return 10 if value.to_i == 0

      value.to_i
    end
  end

  def ace?
    value == 'A'
  end
end
