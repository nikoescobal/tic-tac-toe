#!/usr/bin/env ruby
# frozen_string_literal: true

matrix = [
  [0, 0, 0],
  [0, 0, 0],
  [0, 0, 0]
]

def display_board(matrix)
  x = 0
  while x < matrix.length
    y = 0
    while y < matrix[x].length
      print matrix[x][y].to_s
      y += 1
    end
    x += 1
    puts
  end
end

# Elements needed:
# Player class to make two players
# Win conditions
# Rules
# Moves

# Classes - Player, Shape, Game Board
# Player - Needs to be assigned a shape and a name
# Game Board - Needs number of turns, W-L-D conditions
# main.rb file will call the game board, shape, and player classes

# game_on = true

# Here you ask the users for their names and shapes

puts 'enter name for player 1:'
gets.chomp

puts 'enter name for player 2: '
gets.chomp

puts 'enter shape for player 1: '
gets.chomp

puts 'enter shape for player 2: '
gets.chomp

# Here player 1 is created with a given name and shape
# Here player 2 is created with a given name and shape
# Here a board is created with the two players competing

i = 0

while i < 9
  puts 'Player 1, please enter your desired x-coordinate: '
  gets.chomp.to_i
  puts 'Player 1, please enter your desired y-coordinate: '
  gets.chomp.to_i
  puts 'Player 2, please enter your desired x-coordinate: '
  gets.chomp
  puts 'Player 2, please enter your desired y-coordinate: '
  gets.chomp
  display_board(matrix)
  i += 1
end

puts 'player 1 has won the game.'

# Here you constantly ask the users via a loop to enter their move, until someone wins/loses or if there's a draw
# Upon input, the game will inform if either player has entered a valid input for their respective moves
# Upon entering a move, the game immediately displays the board with each player's move reflected upon entry
# The game informs if a draw has been reached once all moves have been exhausted

# if win || draw
# game_on = false
# end

# After each player enters their coordinates, the values are then plotted on the board for each turn.

# Until a win, loss, or draw is reached, then the game ends and the program exits.
