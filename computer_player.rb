class ComputerPlayer

  attr_reader :name, :symbol, :opposing_symbol, :difficulty, :delay

  def initialize(name, symbol, difficulty, delay)
    @name = name
    @symbol = symbol
    @difficulty = difficulty
    @delay = delay
    @opposing_symbol = symbol == "X" ? "O" : "X"
  end

  def get_move(board)
    case difficulty
    when "easy" then easy_move(board)
    when "medium" then medium_move(board)
    when "hard" then hard_move(board)
    end
  end

  def easy_move(board)
    get_moves(board).sample
  end

  def medium_move(board)
    moves = get_moves(board)
    threat_move = check_moves(board, moves, opposing_symbol)
    threat_move ? threat_move : moves.sample
  end

  def hard_move(board)
    sleep(3) if delay

    moves = get_moves(board)

    return 4 if moves.include?(4)

    winning_move = check_moves(board, moves, symbol)
    return winning_move if winning_move
    threat_move = check_moves(board, moves, opposing_symbol)
    return threat_move if threat_move
    moves.sample
  end

  def get_moves(board)
    moves = []
    (0..8).each {|pos| moves << pos if board.grid[pos] != "X" && board.grid[pos] != "O"}
    moves
  end

  def check_moves(board, moves, symbol)
    moves.each do |move|
      board.grid[move] = symbol
      if board.is_winning_move?(symbol)
        board.grid[move] = move + 1
        return move
      else
        board.grid[move] = move + 1
      end
    end
    false
  end
end
