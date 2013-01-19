class Towers

  attr_accessor :t1, :t2, :t3
  attr_reader :disks
  def initialize disks
    @t1 = Array(1..disks).reverse!
    @t2 = []
    @t3 = []
    @towers = [@t1, @t2, @t3]
    @disks = disks
  end

  def run_towers
    until won?
      from, to = get_input
      make_move(from,to) if valid_move?(from, to)
    end
  end

  def valid_move?(from, to)
    return false if @towers[from].length == 0
    return false if from == to
    return false if @towers[to].size > 0 && @towers[from].last > @towers[to].last
    true
  end

  def make_move(from, to)
    @towers[to] << @towers[from].pop
  end

  def get_input
    puts "From? (0 - 2)"
    from = gets.chomp.to_i
    puts "To? (0 - 2)"
    to = gets.chomp.to_i
    [from, to]
  end

  def won?
    @t2.size == @disks || @t3.size == @disks
  end

end




