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
    count.times { self.hand << deck.give_random_card }
    calculate_score
  end

  def clean_hand
    self.hand = []
  end

  private

  attr_writer :hand

  def calculate_score
    @score = 0

    hand.each do |card|
      @score += 1 if card.ace? && may_exceed_threshold?(card.score)

      @score += card.score
    end
  end

  def may_exceed_threshold?(card_score)
    @score + card_score > Game::WIN_THRESHOLD
  end
end