require_relative '../lib/board'
require_relative '../lib/player'

describe Board do  

draw_matrix = [
  ["x", "o", "x"],  
  ["o", "o", "x"],
  ["x", "x", "o"]
]

win_matrix_1 = [
  ["x", "x", "x"],  
  ["o", "o", "x"],
  ["o", "x", "o"]
]

win_matrix_2 = [
  ["o", "o", "x"],  
  ["o", "o", "x"],
  ["x", "x", "o"]
]

  player1 = Player.new("Chad", "x")
  player2 = Player.new("Jake", "o")

  describe "#add_position" do
    it "adds the selected position to the board" do
      board = Board.new(player1, player2)
      board.add_position(1, 1, "o")
      expect(board.matrix[1][1]).to eq("o")
    end

    it "fails to add the selected position to the board" do
      board = Board.new(player1, player2)
      board.add_position(1, 1, "o")
      expect(board.matrix[1][1]).to_not eq("x")
    end

  end

  describe "#turn_counter" do
    it "counts the number of turns" do
      board = Board.new(player1, player2)
      board.turn_counter
      expect(board.counter).to eq(1)
    end

    it "checks if it is player 1's turn" do
      board = Board.new(player1, player2)
      board.turn_counter
      player_turn = board.turn_counter
      expect(player_turn).to eq(player1)
    end

    it "checks if it is not player 1's turn" do
      board = Board.new(player1, player2)
      player_turn = board.turn_counter
      expect(player_turn).to_not eq(player1)
    end

    it "checks if it is player 2's turn" do
      board = Board.new(player1, player2)
      player_turn = board.turn_counter
      expect(player_turn).to eq(player2)
    end

    it "checks if it is not player 2's turn" do
      board = Board.new(player1, player2)
      player_turn = board.turn_counter
      expect(player_turn).to_not eq(player1)
    end
  end

  describe "#draw" do

    it "checks if the game is a draw" do
      board = Board.new(player1, player2)
      board.matrix = draw_matrix
      flag = board.draw
      expect(flag).to eq(true)
    end

    it "checks if the game is not a draw" do
      board = Board.new(player1, player2)
      flag = board.draw
      expect(flag).to eq(false)
    end
  end

  describe "#win" do

    it "checks if player 1 has won the game" do
      board = Board.new(player1, player2)
      board.matrix = win_matrix_1
      flag = board.win("x")
      expect(flag).to eq(true)
    end

    it "checks if player 2 has won the game" do
      board = Board.new(player1, player2)
      board.matrix = win_matrix_2
      flag = board.win("o")
      expect(flag).to eq(true)
    end

    it "checks if the game is not a win" do
      board = Board.new(player1, player2)
      board.matrix = draw_matrix
      flag = board.win("x")
      expect(flag).to eq(false)
    end
  end

  describe "#input_valid?" do

    it "checks if the input for a move is valid" do
      board = Board.new(player1, player2)
      flag = board.input_valid?(1,1)
      expect(flag).to eq(true)
    end
  end
end