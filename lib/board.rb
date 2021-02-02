# frozen_string_literal: true

class Board
  attr_reader :matrix, :turn_player, :counter
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @counter = 0 
    @matrix = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil],
    ]
  end

  def add_position(row, column, shape)
    @matrix[row][column] = shape
  end
  # [5, 2, 3, 1, 0]


  def turn_counter()
    @counter += 1
    if @counter.odd?
      return @player1
    else 
      return @player2
    end
  end 

  def get_coordinate(coordinate)
    if input_valid?(coordinate)
      return coordinate
    end
  end

  def draw
    x = 0 
    while x < matrix.length
      y = 0
      while y < matrix[x].length
        if matrix[x][y] == nil
          return false
        end
        y += 1
      end
      x += 1
    end
    return true
  end

 def diagonals
  x = 0 
  y = 0
  while y < @matrix.length
    if @matrix[x][y] == @matrix[x + 1][y + 1] && @matrix[x][y] == @matrix[x + 2][y + 2] 
      return true
    end
    if @matrix[x][y + 2] == @matrix[x + 1][y + 1] && @matrix[x][y + 2] == @matrix[x + 2][y]
      return true
    end
   y += 1
  end
  return false
  end

  def vertical
    x = 0
    y = 0
    while y < @matrix.length
      if @matrix[x][y] == @matrix[x + 1][y] && @matrix[x][y] == @matrix[x + 2][y]
        return true
      end
      y += 1      
    end
  end

  def horizontal
  x = 0
  while x < @matrix.length 
    y = 0
    while y < @matrix[x].length
        if @matrix[x][y] == @matrix[x][y + 1] && @matrix[x][y] == @matrix[x][y + 2]
          return true
        end
        y += 1
    end 
    x += 1
  end
end

def win
  if horizontal || vertical || diagonals
    return true
  else
    return false
  end
end

  private
  def input_valid?(coordinate)
    if coordinate < 0 && coordinate > 2 
      return false
    else 
      return true
    end
  end
end