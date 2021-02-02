# !/usr/bin/env ruby
# frozen_string_literal: true

require_relative '..//lib/board'
require_relative '..//lib/player'

# Elements needed:
# Player class to make two players
# Win conditions
# Rules
# Moves

# Classes - Player, Shape, Game Board
# Player - Needs to be assigned a shape and a name
# Game Board - Needs number of turns, W-L-D conditions
# main.rb file will call the game board, shape, and player classes

# Start with player and shape classes, then game board (this will be the hardest)

# Here you ask the users for their names and shapes

puts 'enter name for player 1:'
name1 = gets.chomp

while name1 == "" 
  puts "Player 1, please don't enter a blank value. Enter a new name: "
  name1 = gets.chomp
end

puts 'enter name for player 2:'
name2 = gets.chomp

while name2 == "" 
  puts "Player 2, please don't enter a blank value. Enter a new name: "
  name2 = gets.chomp
end

while name1.downcase == name2.downcase
  puts "Player 2, please enter a different name to avoid confusion. Enter new name: "
  name2 = gets.chomp
end

puts 'enter shape for player 1: '
shape1 = gets.chomp

puts 'enter shape for player 2: '
shape2 = gets.chomp

while shape1 == "" 
  puts "Player 1, please don't enter a blank value. Enter a new shape: "
  shape1 = gets.chomp
end

while shape2 == "" 
  puts "Player 2, please don't enter a blank value. Enter a new shape: "
  shape2 = gets.chomp
end

while shape1.downcase == shape2.downcase
  puts "Player 2, please enter a different shape to avoid confusion. Enter new shape: "
  shape2 = gets.chomp
end

# Here player 1 is created with a given name and shape
# Here player 2 is created with a given name and shape
# Here a board is created with the two players competing

player1 = Player.new(name1, shape1)
puts "#{name1} starts first, with #{shape1}."

player2 = Player.new(name2, shape2)
puts "#{name2} starts second, with #{shape2}."

board = Board.new(player1, player2)
puts "The game will now commence between #{player1.name}, and #{player2.name}"

def display_board(board)
  x = 0
  while x < board.length
    y = 0
    while y < board[x].length
      print (board[x][y]).to_s + ' '
      y += 1
    end
    x += 1
    puts
  end
end

player_turn = nil

puts board.win
puts board.draw

while !board.win || !board.draw
  display_board(board.matrix)
  player_turn = board.turn_counter 
  puts "#{player_turn.name}, please enter your desired x-coordinate: "
  x = gets.chomp.to_i
  puts "#{player_turn.name}, please enter your desired y-coordinate: "
  y = gets.chomp.to_i
  board.add_position(x, y, player_turn.shape)
    if board.win
      puts "#{player_turn.name} has won"
    end
    if  board.draw
      puts "#{player_turn.name} has drawn."
    end
end

puts board.win
puts board.draw

# Here you constantly ask the users via a loop to enter their move, until someone wins/loses or if there's a draw
# Upon input, the game will inform if either player has entered a valid input for their respective moves
# Upon entering a move, the game immediately displays the board with each player's move reflected upon entry
# The game informs if a draw has been reached once all moves have been exhausted


# if win || draw
# game_on = false
# end

# After each player enters their coordinates, the values are then plotted on the board for each turn.

# Until a win, loss, or draw is reached, then the game ends and the program exits.
