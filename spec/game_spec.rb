require './lib/game'

describe Game do
  describe '#start' do
    subject(:game) { described_class.new }
    let(:board) { Board.new }

    before do
      allow(game).to receive(:over?).and_return(false, true)
      allow(game).to receive(:draw?).and_return(false, true)
      game.instance_variable_set(:@board, board)
    end

    it 'loop the game once' do
      expect(board).to receive(:print_board).once
      expect(game).to receive(:play).once
      game.start
    end
  end

  describe '#check_lines?' do
    subject(:game) { described_class.new }
    let(:board) { Board.new }

    it 'returns false in an empty board' do
      expect(game.check_lines?).to be false
    end

    it 'returns true when line 1 is equal' do
      board.instance_variable_set(:@board, [
        ['X', 'X', 'X'],
        [' ', ' ', ' '],
        [' ', ' ', ' '],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.check_lines?).to be true
    end

    it 'returns true when line 2 is equal' do
      board.instance_variable_set(:@board, [
        [' ', ' ', ' '],
        ['X', 'X', 'X'],
        [' ', ' ', ' '],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.check_lines?).to be true
    end

    it 'returns true when line 3 is equal' do
      board.instance_variable_set(:@board, [
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        ['X', 'X', 'X'],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.check_lines?).to be true
    end
  end

  describe '#check_columns?' do
    subject(:game) { described_class.new }
    let(:board) { Board.new }

    it 'returns false in an empty board' do
      expect(game.check_lines?).to be false
    end

    it 'returns true when column 1 is equal' do
      board.instance_variable_set(:@board, [
        ['X', ' ', ' '],
        ['X', ' ', ' '],
        ['X', ' ', ' '],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.check_columns?).to be true
    end

    it 'returns true when column 2 is equal' do
      board.instance_variable_set(:@board, [
        [' ', 'X', ' '],
        [' ', 'X', ' '],
        [' ', 'X', ' '],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.check_columns?).to be true
    end

    it 'returns true when column 3 is equal' do
      board.instance_variable_set(:@board, [
        [' ', ' ', 'X'],
        [' ', ' ', 'X'],
        [' ', ' ', 'X'],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.check_columns?).to be true
    end
  end

  describe '#check_diagonals?' do
    subject(:game) { described_class.new }
    let(:board) { Board.new }

    it 'returns false in an empty board' do
      expect(game.check_lines?).to be false
    end

    it 'returns true when diagonal 1 is equal' do
      board.instance_variable_set(:@board, [
        ['X', ' ', ' '],
        [' ', 'X', ' '],
        [' ', ' ', 'X'],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.check_diagonals?).to be true
    end

    it 'returns true when diagonal 2 is equal' do
      board.instance_variable_set(:@board, [
        [' ', ' ', 'X'],
        [' ', 'X', ' '],
        ['X', ' ', ' '],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.check_diagonals?).to be true
    end
  end

  describe '#over?' do
    subject(:game) { described_class.new }
    let(:board) { Board.new }

    it 'returns false when not over' do
      allow(game).to receive(:check_lines?).and_return(false)
      allow(game).to receive(:check_columns?).and_return(false)
      allow(game).to receive(:check_diagonals?).and_return(false)

      expect(game.over?).to be false
    end

    it 'returns true when over' do
      allow(game).to receive(:check_lines?).and_return(true)

      expect(game.over?).to be true
    end
  end

  describe '#draw?' do
    subject(:game) { described_class.new }
    let(:board) { Board.new }

    it 'returns false when is not a draw' do
      board.instance_variable_set(:@board, [
        [' ', ' ', 'X'],
        [' ', 'O', ' '],
        ['X', ' ', ' '],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.draw?).to be false
    end

    it 'returns false when over' do
      board.instance_variable_set(:@board, [
        ['X', 'O', 'X'],
        ['O', 'X', 'O'],
        ['X', 'O', 'O'],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.draw?).to be false
    end

    it 'returns true when it is a draw' do
      board.instance_variable_set(:@board, [
        ['O', 'X', 'O'],
        ['X', 'X', 'O'],
        ['X', 'O', 'X'],
      ])
      game.instance_variable_set(:@board, board)

      expect(game.draw?).to be true
    end
  end
end
