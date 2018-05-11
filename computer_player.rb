class ComputerPlayer

  attr_reader :name, :symbol, :difficulty

  def initialize(name, symbol, difficulty)
    @name = name
    @symbol = symbol
    @difficulty = difficulty
  end

  def get_move(board)
    case difficulty
    when "easy" then easy_move(board)
    when "medium" then medium_move(board)
    when "hard" then hard_move(board)
    end
  end

  def easy_move(board)
    moves = []
    (0..8).each {|pos| moves << pos if board.grid[pos] != "X" && board.grid[pos] != "O"}
    moves.sample
  end

  def medium_move(board)
    moves = []
    (0..8).each {|pos| moves << pos if board.grid[pos] != "X" && board.grid[pos] != "O"}

    if symbol == "X"
      opposing_symbol = "O"
    else
      opposing_symbol = "X"
    end

    moves.each do |move|
      board.grid[move] = opposing_symbol
      if board.is_winning_move?(opposing_symbol)
        board.grid[move] = move + 1
        return move
      else
        board.grid[move] = move + 1
      end
    end
    moves.sample
  end

  def hard_move(board)
    moves = []
    (0..8).each {|pos| moves << pos if board.grid[pos] != "X" && board.grid[pos] != "O"}

    if symbol == "X"
      opposing_symbol = "O"
    else
      opposing_symbol = "X"
    end

    moves.each do |move|
      board.grid[move] = symbol
      if board.is_winning_move?(symbol)
        board.grid[move] = move + 1
        return move
      end

      board.grid[move] = opposing_symbol
      if board.is_winning_move?(opposing_symbol)
        board.grid[move] = move + 1
        return move
      else
        board.grid[move] = move + 1
      end
    end
    moves.sample
  end
end
