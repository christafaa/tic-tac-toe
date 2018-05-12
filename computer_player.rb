class ComputerPlayer

  attr_reader :name, :symbol, :difficulty, :delay

  def initialize(name, symbol, difficulty, delay)
    @name = name
    @symbol = symbol
    @difficulty = difficulty
    @delay = delay
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
    if delay
      sleep(3)
    end
    moves = []
    (0..8).each {|pos| moves << pos if board.grid[pos] != "X" && board.grid[pos] != "O"}

    if symbol == "X"
      opposing_symbol = "O"
    else
      opposing_symbol = "X"
    end

    if moves.include?(4)
      return 4
    end

    moves.each do |move|
      board.grid[move] = symbol
      if board.is_winning_move?(symbol)
        board.grid[move] = move + 1
        return move
      else
        board.grid[move] = move + 1
      end
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
end
