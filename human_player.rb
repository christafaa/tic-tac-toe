class HumanPlayer

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_move
    puts "Where would you like to place an X?"
    input = gets.chomp
    input_array = input.split(', ')
    move = [input_array[0].to_i, input_array[1].to_i]
  end

  def display(board)
    pos = board.grid.flatten
    pos.each_with_index do |ele, idx|
      if ele == nil
        pos[idx] = ' '
      end
    end

    puts "#{pos[0]} | #{pos[1]} | #{pos[2]}"
    puts "_________"
    puts "#{pos[3]} | #{pos[4]} | #{pos[5]}"
    puts "_________"
    puts "#{pos[6]} | #{pos[7]} | #{pos[8]}"
  end

end
