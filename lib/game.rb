# frozen_string_literal: true

class Game
  START_WORTH = 100
  WIN_THRESHOLD = 21

  attr_reader :player, :dealer, :deck

  def initialize(player)
    @player = player
    @dealer = Dealer.new
    sides.each { |side| side.bank = START_WORTH }
    @deck = Deck.new
  end

  def start
    sides.each do |side|
      side.take_card(deck, 2)
      side.bank -= 10
    end

    @bank = 20
  end

  def count_results
    process_draw if player.score == dealer.score

    if player.score > dealer.score
      process_overscoring(player, dealer)
    else
      process_overscoring(dealer, player)
    end
  end

  private

  attr_writer :player, :dealer, :deck

  def process_draw
    @bank = 0
    player.bank += 10
    dealer.bank += 10
  end

  def process_overscoring(leading_player, lagging_player)
    if leading_player.score < WIN_THRESHOLD
      process_win(leading_player)
    else
      process_win(lagging_player)
    end
  end

  def process_win(winner)
    winner.bank += @bank
    @bank = 0
  end

  def sides
    @sides ||= [player, dealer]
  end
end
