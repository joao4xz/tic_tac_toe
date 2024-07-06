# frozen_string_literal: true

# The Player class represents a player in the game.
class Player
  def initialize(symbol)
    puts("Initialize Player #{symbol}")
    @symbol = symbol
  end
end