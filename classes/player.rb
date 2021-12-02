# frozen_string_literal: true

class Player
  attr_accessor :name, :bank
  attr_reader :hand, :score

  def initialize(name)
    @hand = []
    @name = name
    @score = 0
    @bank = 0
  end

  def take_card(deck, count = 1)
    count.times do
      taken_card = deck.give_random_card
      self.score += taken_card
      hand << taken_card
    end
  end

  def clean_hand
    self.hand = []
  end

  private

  attr_writer :hand, :score
end