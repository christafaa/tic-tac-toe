class Board
  attr_accessor :grid

  def initialize(grid=[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    @grid = grid
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    grid[row][col] = mark
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos] == nil
  end

  def winner
    if has_winning_combo?(:X)
      return :X
    elsif has_winning_combo?(:O)
      return :O
    end
  end

  def over?
    return false if grid.flatten.all? {|pos| pos == nil}
    return true if grid.flatten.all? {|pos| pos != nil}
    return true if winner
  end

  def has_winning_combo?(sym)
    winning_combinations = [
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]]
    ]

    winning_combinations.each do |combo|
      return true if combo.all? {|pos| self[pos] == sym}
    end
    false
  end

end
