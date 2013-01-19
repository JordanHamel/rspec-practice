class TicTacToe
  attr_accessor :board, :players
  def initialize
    @players = ComputerPlayer.new(self)
  end

  def setup_board
    @board = Array.new(3) {Array.new(3)}
  end

  def play
    until won?
      print_board
      make_move(player1.get_move)
      print_board
      make_move(player2.get_move)
    end
  end

  def make_move(arr)
    if @board[arr[0]][arr[1]].nil?
      @board[arr[0]][arr[1]] = "X"
    else
      raise ArgumentError
    end
  end

  def won?
    return true if row? || column? || diag?
    false
  end

  def row?
    @board.any? do |row|
      row == ["X"] * 3 || row == ["O"] * 3
    end
  end

  def column?
    x_hash = Hash.new(0)
    o_hash = Hash.new(0)
    @board.each_with_index do |row, i|
      @board.each_with_index do |col,j|
        x_hash[j] += 1 if @board[i][j] == "X"
        o_hash[j] += 1 if @board[i][j] == "O"
      end
    end
    x_hash.values.include?(3) || o_hash.values.include?(3)
  end

  def diag?
    [@board[0][0], @board[1][1], @board[2][2]] == ["X"]*3 ||
    [@board[0][0], @board[1][1], @board[2][2]] == ["O"]*3 ||
    [@board[0][2], @board[1][1], @board[2][0]] == ["X"]*3 ||
    [@board[0][2], @board[1][1], @board[2][0]] == ["Y"]*3
  end

end

class ComputerPlayer
  attr_accessor :game
  def initialize(game)
    @game = game
  end

  def get_move
    while true
      x_move = rand(3)
      y_move = rand(3)
      return [x_move, y_move] if @game.board[x_move][y_move].nil?
    end
  end
end