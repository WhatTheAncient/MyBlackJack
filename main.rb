require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/dealer'
require_relative 'lib/game'
require_relative 'lib/interface'

interface = Interface.new

interface.start_game_session
