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
    @turn = 'X'
    @winner = ''
  end

  def start
    puts 'Welcome to Tic Tac Toe!'
    while !over? && !draw?
      @board.print_board
      play
    end


  end

  def check_lines?
    @board.board.each do |row|
      return true if row[0] != ' ' && row[0] == row[1] && row[0] == row[2]
    end
    false
  end

  def check_columns? # rubocop:disable Metrics/AbcSize
    @board.board.each_index do |i|
      if @board.board[0][i] != ' ' &&
         @board.board[0][i] == @board.board[1][i] &&
         @board.board[0][i] == @board.board[2][i]
        return true
      end
    end
    false
  end

  def check_diagonals? # rubocop:disable Metrics/AbcSize
    @board.board[1][1] != ' ' && (@board.board[0][0] == @board.board[1][1] && @board.board[0][0] == @board.board[2][2] ||
      @board.board[0][2] == @board.board[1][1] && @board.board[0][2] == @board.board[2][0])
  end

  def over?
    if check_lines? || check_columns? || check_diagonals?
      @winner = @turn == @player_x.symbol ? @player_o.symbol : @player_x.symbol

      @board.print_board
      puts "Player #{@winner} is the winner!"
      return true
    end
    false
  end

  def draw?
    if @board.board.flatten.none?(' ') && !over?
      @board.print_board
      puts "It's a draw!"
      return true
    end
    false
  end

  private

  def play
    puts "Player #{@turn}'s turn!"

    line = get_position('line')
    return puts 'Invalid line number!' unless line.between?(0, 2)

    col = get_position('column')
    return puts 'Invalid column number!' unless line.between?(0, 2)

    return puts 'Invalid place!' unless @board.board[line][col] == ' '

    @board.board[line][col] = @turn
    @turn = @turn == @player_x.symbol ? @player_o.symbol : @player_x.symbol
  end

  def get_position(type)
    puts "Write the #{type} you want to play:"
    gets.chomp.to_i - 1
  end
end
