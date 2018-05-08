class ComputerPlayer

  attr_accessor :name, :board, :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        moves << pos if board[pos].nil?
      end
    end

    moves.each do |move|
      board.place_mark(move, :O)
      if board.winner == :O
        board[move] = nil
        return move
      else
        board[move] = nil
      end
    end
    moves.sample
  end

end
