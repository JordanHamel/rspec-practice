require 'rspec'
require_relative 'tictactoe'

describe TicTacToe do
  subject(:game) {TicTacToe.new}

  describe "#setup_board" do
    it "makes a 3 x 3 board of nils" do
      game.setup_board.should eq([[nil, nil, nil],
                                  [nil, nil, nil],
                                  [nil, nil, nil]])
    end
  end

  describe "#make_move" do
    it "puts x in the middle of the board" do
      game.setup_board
      game.make_move([1, 1])
      game.board[1][1].should == "X"
    end
    it "raises an error if not nil" do
      game.setup_board
      game.make_move([1, 1])

      expect do
        game.make_move([1, 1])
      end.to raise_error(ArgumentError)
    end
  end

  describe "#row?" do
    it "returns true with 3 in a row" do
      game.setup_board
      game.board[1] = ["O"]*3
      game.row?.should eq(true)
    end
  end

  describe "#column?" do
    it "returns true with 3 is a column" do
      game.setup_board
      game.board[0][1] = "X"
      game.board[1][1] = "X"
      game.board[2][1] = "X"
      game.column?.should eq(true)
    end
  end

  describe "#diag?" do
    it "returns true with 3 in a diagonal" do
      game.setup_board
      game.board[0][0] = "X"
      game.board[1][1] = "X"
      game.board[2][2] = "X"
      game.diag?.should eq(true)
    end
  end

  describe "#won?" do
    it "returns true when row/diag/column true" do
      game.setup_board
      game.board[0][0] = "O"
      game.board[1][1] = "O"
      game.board[2][2] = "O"
      game.won?.should eq(true)
    end

    it "returns false if you haven't won" do
      game.setup_board
      game.won?.should equal(false)
    end
  end
end

describe ComputerPlayer do
  let(:game) {double("tictactoe", :board => [[1, 1, 1],
                                            [1, nil, 1],
                                            [1, 1, 1]])}
  subject(:comp) {ComputerPlayer.new(game)}

  describe "#get_move" do
    it "only chooses places not taken" do
      comp.get_move.should eq([1,1])
    end
  end
end