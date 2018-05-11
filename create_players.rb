require_relative 'computer_player'
require_relative 'human_player'

def create_players(number_of_players)
  if number_of_players == 1
    print "Player 1, enter your name: "
    name = gets.chomp
    difficulty = select_difficulty
    symbol = select_symbol(name)
    player_one = HumanPlayer.new(name, symbol)

    if symbol == 'X'
      computer_symbol = 'O'
    else
      computer_symbol = 'X'
    end

    player_two = ComputerPlayer.new("Joshua (Computer)", computer_symbol, difficulty)

    [player_one, player_two]

  elsif number_of_players == 2
    print "Player 1, enter your name: "
    player_one_name = gets.chomp
    player_one_symbol = select_symbol(player_one_name)
    player_one = HumanPlayer.new(player_one_name, player_one_symbol)

    print "Player 2, enter your name: "
    player_two_name = gets.chomp

    if player_one_symbol == 'X'
      player_two_symbol = 'O'
    else
      player_two_symbol = 'X'
    end

    puts "#{player_two_name} you are '#{player_two_symbol}'"

    player_two = HumanPlayer.new(player_two_name, player_two_symbol)

    [player_one, player_two]

  elsif number_of_players == 0
    player_one = ComputerPlayer.new("Joshua", "X")
    player_two = ComputerPlayer.new("Hal", "O")
    puts [player_one, player_two]
  end
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
