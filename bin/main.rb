#!/usr/bin/env ruby

require_relative "../lib/player.rb"
require_relative "../lib/board.rb"

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

puts "enter name for player 1:"
name1 = gets.chomp

puts "enter name for player 2: "
name2 = gets.chomp

puts "enter shape for player 1: "
shape1 = gets.chomp

puts "enter shape for player 2: "
shape2 = gets.chomp

# Here player 1 is created with a given name and shape 
# Here player 2 is created with a given name and shape 
# Here a board is created with the two players competing 

# Here you constantly ask the users via a loop to enter their move, until someone wins/loses or if there's a draw

puts "Player 1, please enter your desired x-coordinate: "
x = gets.chomp.to_i

puts "Player 1, please enter your desired y-coordinate: "
y = gets.chomp.to_i

# puts "Player 2, please enter your desired x-coordinate: "
# x = gets.chomp

# puts "Player 2, please enter your desired y-coordinate: "
# y = gets.chomp 

# After each player enters their coordinates, the values are then plotted on the board for each turn. 

# Until a win, loss, or draw is reached, then the game ends and the program exits.

player1 = Player.new(name1, shape1)
puts "#{player1.name} will start first as player 1, taking the #{player1.shape} shape."

player2 = Player.new(name2, shape2)
puts "#{player2.name} will start second as player 2, taking the #{player2.shape} shape."

board = Board.new(player1, player2)
puts board.matrix
puts board.add_position(x, y, shape1)
puts board.add_position(x, y, shape2)
puts board.add_position(x, y, shape1)
puts board.add_position(x, y, shape2)
puts board.add_position(x, y, shape1)
puts board.add_position(x, y, shape2)