class Board
  attr_accessor :grid, :winner

  @@winning_combinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(grid=[1, 2, 3, 4, 5, 6, 7, 8, 9])
    @grid = grid
    @winner = nil
  end

  def place_mark(pos, mark)
    grid[pos] = mark
  end

  def empty?(input)
    grid[input] != "X" && grid[input] != "O"
  end

  def winner?
    has_winning_combo?("X") || has_winning_combo?("O")
  end

  def over?
    return true if winner?
    return true if grid.all? {|pos| pos == "X" || pos == "O"}
    false
  end

  def is_winning_move?(opposing_symbol)
    @@winning_combinations.each do |combo|
      return true if combo.all? {|pos| self.grid[pos] == opposing_symbol}
    end
    false
  end

  def has_winning_combo?(symbol)
    @@winning_combinations.each do |combo|
      if combo.all? {|pos| grid[pos] == symbol}

        combo.each do |pos|
          grid[pos] = "*#{symbol}*"
        end
        (0..8).each do |pos|
          grid[pos] = " #{grid[pos]} " unless combo.include?(pos)
        end
        self.winner = symbol
        return true
      end
    end
    false
  end

  def display
    puts
    puts "         |         |     "
    puts "    #{grid[0]}    |    #{grid[1]}    |    #{grid[2]}    "
    puts "         |         |     "
    puts " --------------------------- "
    puts "         |         |     "
    puts "    #{grid[3]}    |    #{grid[4]}    |    #{grid[5]}    "
    puts "         |         |     "
    puts " --------------------------- "
    puts "         |         |     "
    puts "    #{grid[6]}    |    #{grid[7]}    |    #{grid[8]}    "
    puts "         |         |     "
    puts "==================================="
  end

  def display_winner
    puts
    puts "           |           |     "
    puts "    #{grid[0]}    |    #{grid[1]}    |    #{grid[2]}    "
    puts "           |           |     "
    puts " --------------------------------- "
    puts "           |           |     "
    puts "    #{grid[3]}    |    #{grid[4]}    |    #{grid[5]}    "
    puts "           |           |     "
    puts " --------------------------------- "
    puts "           |           |     "
    puts "    #{grid[6]}    |    #{grid[7]}    |    #{grid[8]}    "
    puts "           |           |     "
    puts "==================================="
  end
end
