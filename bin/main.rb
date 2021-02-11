# !/usr/bin/env ruby
# frozen_string_literal: true

require_relative '..//lib/board'
require_relative '..//lib/player'

def ask_name(player_num)
  puts "Player #{player_num}, what is your name?"
  name = gets.chomp
  while name == ''
    puts "Player #{player_num}, please don't enter a blank value. Enter a new name: "
    name = gets.chomp
  end
  name
end

def display_board(matrix)
  x = 0
  while x < matrix.length
    y = 0
    while y < matrix[x].length
      if y < matrix[x].length - 1
        print "#{matrix[x][y]} | "
      else
        print "#{matrix[x][y]}   "
      end
      y += 1
    end
    puts
    puts '--+---+--' if x < matrix.length - 1
    x += 1
  end
end

def ask_coordinate(player, coordinate)
  puts "#{player.name}, please enter desired #{coordinate}-coordinate (pick from 1 to 3): "
  coordinate = gets.chomp.to_i - 1
  while coordinate.negative? || coordinate > 2
    puts "#{player.name}, please only enter a value from 1 to 3: "
    coordinate = gets.chomp.to_i - 1
  end
  coordinate
end

name1 = ask_name(1)
name2 = ask_name(2)

while name1.downcase == name2.downcase
  puts 'Player 2, please enter a different name to avoid confusion. Enter new name: '
  name2 = gets.chomp
end

shape1 = "\u2718"
shape2 = "\u25EF"

while shape1.downcase == shape2.downcase
  puts 'Player 2, please enter a different shape to avoid confusion. Enter new shape: '
  shape2 = gets.chomp
end

player1 = Player.new(name1, shape1)
puts "#{name1} starts first, with #{shape1}."

player2 = Player.new(name2, shape2)
puts "#{name2} starts second, with #{shape2}."

board = Board.new(player1, player2)
puts "The game will now commence between #{player1.name}, and #{player2.name}"

player_turn = player1
has_won = false

display_board(board.matrix)

while !board.draw && !has_won
  x = ask_coordinate(player_turn, 'x')
  y = ask_coordinate(player_turn, 'y')
  if board.input_valid?(x, y)
    board.add_position(x, y, player_turn.shape)
    has_won = board.win(player_turn.shape)
    display_board(board.matrix)
    has_won ? break : player_turn = board.turn_counter
  else
    puts "The coordinates you've entered have already been taken. Please enter different coordinates."
  end
end

if has_won
  puts "#{player_turn.name} has won."
elsif board.draw
  puts 'Neither player has won. The game is a draw.'
end
