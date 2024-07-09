# frozen_string_literal: true

# The Board class represents the game board.
class Board
  attr_accessor :board

  def initialize
    puts 'Initialize Board'

    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def print_board
    puts "\n"
    @board.each_with_index do |line, line_index|
      line.each_index do |col_index|
        print " #{board[line_index][col_index]} "
        print '|' if col_index != line.length - 1
      end
      print "\n———|———|———\n" if line_index != board.length - 1
    end
    puts "\n\n"
  end
end
