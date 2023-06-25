# frozen_string_literal: true

class Interface
  USER_CHOICES = {
    '0' => 'Pass',
    '1' => 'Add card',
    '2' => 'Open hands'
  }.freeze

  def initialize
    print 'Please enter your name: '
    player_name = gets.chomp

    @player = Player.new(player_name)
    @game = Game.new(player)
    @user_choice = nil
    @end_of_game_session = false
  end

  def start_game_session
    until end_of_game_session
      start_round
      process_user_choice
      open_hands
      game.count_results
      new_round
    end
  end

  def start_round
    game.start
    show_hands
    show_user_choices
  end
  
  def process_user_choice
    user_choice = gets.chomp

    case user_choice
    when '0' then game.dealer.take_card(game.deck)
    when '1' then add_card
    when '2'
    else puts 'Please enter the correct command'
    end
  end

  def add_card
    player.take_card(game.deck, 1)
    game.dealer.take_card(game.deck)
    show_hands
  end

  def show_hands
    puts "\nDealer hand: (*)  (*)"
    puts show_user_hand
  end

  def show_user_hand
    hand_string = ''
    player.hand.each do |card|
      hand_string += card.value + card.suit + ' '
    end
    "#{player.name}'s hand: #{hand_string}, score: #{player.score}\n"
  end

  def show_user_choices
    puts 'Choose what you want to do: '
    USER_CHOICES.each { |choice, description| puts "#{choice} - #{description}" }
  end

  def open_hands
    puts "\nDealer's score: #{game.dealer.score}"
    puts "Your score: #{player.score}\n"
  end

  def new_round
    puts "Your bank total: #{player.bank}."
    puts 'If you want to start a new round please enter "1". If no, enter another string.'

    choice = gets.chomp
    self.end_of_game_session = true unless choice == '1'

    player.clean_hand
    game.dealer.clean_hand
  end

  private

  attr_accessor :user_choice, :game, :player, :end_of_game_session
end
