require_relative 'computer_player'
require_relative 'human_player'

def create_players(number_of_players)
  if number_of_players == 1
    name = enter_name("Player 1")
    difficulty = select_difficulty
    symbol = select_symbol(name)
    player_one = HumanPlayer.new(name, symbol)
    computer_symbol = symbol == "X" ? "O" : "X"

    player_two = ComputerPlayer.new("Joshua (Computer)", computer_symbol, difficulty, false)

    [player_one, player_two]

  elsif number_of_players == 2
    player_one_name = enter_name("Player 1")
    player_one_symbol = select_symbol(player_one_name)
    player_one = HumanPlayer.new(player_one_name, player_one_symbol)

    player_two_name = enter_name("Player 2")
    player_two_symbol = symbol == "X" ? "O" : "X"

    puts "#{player_two_name} you are '#{player_two_symbol}'"

    player_two = HumanPlayer.new(player_two_name, player_two_symbol)

    [player_one, player_two]

  elsif number_of_players == 0
    player_one = ComputerPlayer.new("Joshua", "X", "hard", true)
    player_two = ComputerPlayer.new("Hal", "O", "hard", true)
    [player_one, player_two]
  end
end

def enter_name(placeholder)
  print "#{placeholder}, enter your name: "
  gets.chomp
end

def select_symbol(name)
  print "#{name}, choose 'X' or 'O': "
  symbol = gets.chomp.upcase

  if symbol != 'X' && symbol != 'O'
    puts "Invalid input!"
    select_symbol(name)
  else
    symbol
  end
end

def select_difficulty
  print "Select a difficulty (easy, medium, or hard): "
  difficulty = gets.chomp.downcase

  if difficulty != "easy" && difficulty != "medium" && difficulty != "hard"
    puts "Invalid input!"
    select_difficulty
  else
    difficulty
  end
end
