# frozen_string_literal: true

class Dealer < Player
  def initialize(name = 'Dealer')
    super
  end

  def take_card(deck, count = 1)
    super if @score <= 17
  end
end
