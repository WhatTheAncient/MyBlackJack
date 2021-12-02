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
    count.times {self.hand << deck.give_random_card}
    score_hand
  end

  def clean_hand
    self.hand = []
  end

  def show_hand
    hand_string = ''
    hand.each do |card|
      hand_string += card.value + card.suit + ' '
    end
    "#{self.name}'s hand: #{hand_string}, score: #{self.score}"
  end

  private

  attr_writer :hand, :score

  def score_hand()
    self.score = 0
    self.hand.each do |card|
      self.score += if card.value.to_i != 0
                      card.value.to_i
                    elsif card !~ /A/
                      10
                    elsif self.score + 11 <= 21
                      11
                    else
                      1
                    end
    end
  end

end