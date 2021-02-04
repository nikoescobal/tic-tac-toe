# frozen_string_literal: true

class Board
  attr_reader :matrix, :turn_player, :counter

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @counter = 0
    @matrix = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def add_position(row, column, shape)
    @matrix[row][column] = shape
  end
  # [5, 2, 3, 1, 0]

  def turn_counter
    @counter += 1
    if @counter.even?
      @player1
    else
      @player2
    end
  end

  def draw
    x = 0
    while x < @matrix.length
      y = 0
      while y < @matrix[x].length
        return false if @matrix[x][y] == ' '

        y += 1
      end
      x += 1
    end
    true
  end

  def win(shape)
    if horizontal(shape) || vertical(shape) || diagonals(shape)
      true
    else
      false
    end
  end

  def input_valid?(row, column)
    @matrix[row][column] == ' '
  end

  private

  def diagonals(shape)
    x = 0
    y = 0
    while y < @matrix.length
      return true if @matrix[x][y] == shape && @matrix[x + 1][y + 1] == shape && @matrix[x + 2][y + 2] == shape
      return true if @matrix[x][y + 2] == shape && @matrix[x + 1][y + 1] == shape && @matrix[x + 2][y] == shape

      y += 1
    end
    false
  end

  def vertical(shape)
    x = 0
    y = 0
    while y < @matrix.length
      return true if @matrix[x][y] == shape && @matrix[x + 1][y] == shape && @matrix[x + 2][y] == shape

      y += 1
    end
  end

  def horizontal(shape)
    x = 0
    while x < @matrix.length
      y = 0
      while y < @matrix[x].length
        return true if @matrix[x][y] == shape && @matrix[x][y + 1] == shape && @matrix[x][y + 2] == shape

        y += 1
      end
      x += 1
    end
  end
end
