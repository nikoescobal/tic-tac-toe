class Board
  attr_reader :matrix
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @matrix = [
      [nil,nil,nil],
      [nil,nil,nil],
      [nil,nil,nil]
    ]
  end

  def add_position(x, y, shape)
    @matrix[x][y] = shape
  end
# [5, 2, 3, 1, 0]

end

