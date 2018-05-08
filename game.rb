require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'welcome'
require_relative 'pick_symbol'

class Game

  attr_accessor :current_player, :player_one, :player_two, :board, :current_mark

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current_player = @player_one
    @current_mark = :X
  end

  def play
    until board.over?
      play_turn
    end
    player_one.display(board)
    if board.winner == :X
      puts "#{player_one.name} won!"
    elsif board.winner == :O
      puts "#{player_one.name} lost!"
    else
      puts "It's a tie!"
    end
  end

  def play_turn
    current_player.display(board)
    move = current_player.get_move
    board.place_mark(move, @current_mark)
    switch_players!
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
      @current_mark = :O
    else
      @current_player = @player_one
      @current_mark = :X
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  welcome
  while true
    print "Enter number of players: "
    number = gets.chomp.to_i
    puts
    if number == 1
      pick_symbol(1)
    elsif number == 2
      pick_symbol(2)
    elsif number == 0

    else
      puts "Please enter 1 or 2"
    end
  end

  human = HumanPlayer.new(name)
  computer = ComputerPlayer.new('Hal')

  new_game = Game.new(human, computer)
  new_game.play
end
