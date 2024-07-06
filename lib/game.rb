# frozen_string_literal: true

require_relative './board'
require_relative './player'

# The Game class initializes Board and Players.
class Game
  def initialize
    puts 'Initialize Game'

    @board = Board.new
    @player_x = Player.new('X')
    @player_o = Player.new('O')
  end
end
