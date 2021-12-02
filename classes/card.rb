# frozen_string_literal: true

class Card
  attr_accessor :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
    @score = 0
  end

  def score
    self.score += if value =~ /^\d$/
                    value.to_i
                  elsif value !~ /A/
                    10
                  elsif self.score + 11 <= 21
                    11
                  else
                    1
                  end
  end

  def to_s
    value + suit
  end

  private

  attr_writer :score

end
