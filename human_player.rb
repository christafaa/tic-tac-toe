class HumanPlayer

  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def get_move(board)

    puts "#{name}, enter a grid number to place an '#{symbol}': "
    input = gets.chomp

    if valid_move?(input, board)
      input.to_i - 1
    else
      system "clear"
      puts "Please enter a valid grid number!"
      get_move(board)
    end
  end

  def valid_move?(input, board)
    input.to_i.to_s == input && input.to_i.between?(1,9) && board.empty?(input.to_i - 1)
  end
end
