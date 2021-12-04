# frozen_string_literal: true

class Game
  attr_reader :player, :dealer, :deck

  def initialize(player)
    @player = player
    @dealer = Dealer.new
    @player.bank = START_WORTH
    @dealer.bank = START_WORTH
    @deck = Deck.new
  end

  def start
    player.take_card(deck, 2)
    dealer.take_card(deck, 2)
    player.bank -= 10
    dealer.bank -= 10
    self.bank = 20
  end

  def count_results
    if player.score == dealer.score
      self.bank = 0
      player.bank += 10
      dealer.bank += 10
    elsif player.score > dealer.score
      if player.score < 21
        player.bank += self.bank
        self.bank = 0
      else
        dealer.bank += self.bank
        self.bank = 0
      end
    elsif dealer.score > player.score
      if dealer.score < 21
        dealer.bank += self.bank
        self.bank = 0
      else
        player.bank += self.bank
        self.bank = 0
      end
    end
  end

  private

  START_WORTH = 100
  attr_writer :player, :dealer, :deck
  attr_accessor :bank
end
