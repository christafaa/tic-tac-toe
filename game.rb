require_relative 'board'
require_relative 'welcome'
require_relative 'create_players'

class Game

  attr_reader :current_player, :player_one, :player_two, :is_two_comps
  attr_accessor :board, :last_turn, :flag

  def initialize(players)
    @player_one = players[0]
    @player_two = players[1]
    @board = Board.new
    @current_player = @player_one
    @last_turn = nil
    @is_two_comps = @player_one.class == ComputerPlayer && @player_two.class == ComputerPlayer
  end

  def play
    until board.over?
      play_turn
    end
    system "clear"
    winning_symbol = board.winner
    if player_one.symbol == winning_symbol
      board.display_winner
      puts "#{player_one.name} won the game!"
    elsif player_two.symbol == winning_symbol
      board.display_winner
      puts "#{player_two.name} won the gam!"
    else
      board.display
      puts "It's a tie!"
    end
  end

  def play_turn
    is_two_comps ? board.display_computer : board.display
    puts last_turn if last_turn
    move = current_player.get_move(board)
    system "clear"
    board.place_mark(move, current_player.symbol)
    self.last_turn = "#{current_player.name} placed an '#{current_player.symbol}' in grid #{move + 1}"
    switch_players!
  end

  def switch_players!
    @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
  end
end

def run
  while true
    print "Enter number of players: "
    number = gets.chomp
    if number.to_i == 1
      players = create_players(1)
      break
    elsif number.to_i == 2
      players = create_players(2)
      break
    elsif number.to_i == 0 && number == "0"
      players = create_players(0)
      break
    else
      puts "Please enter 1 or 2"
    end
  end
  new_game = Game.new(players)
  new_game.play
  play_again
end

def play_again
  print "Want to play again? "
  answer = gets.chomp.downcase

  if answer != "yes" && answer != "no"
    puts "Invalid input!"
    play_again
  else
    answer == "yes" ? run : exit
  end
end

if __FILE__ == $PROGRAM_NAME
  welcome
  run
end
