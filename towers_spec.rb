require 'rspec'
require_relative 'towers'

describe Towers do
  subject(:towers) {Towers.new(3)}
  describe "starting position" do
    its(:t1) {should eq ([3,2,1])}
    its(:t2) {should eq ([])}
    its(:t3) {should eq ([])}
  end

  describe "#make_move" do

    it "moves a piece" do
      towers.make_move(0, 1)
      towers.t2.should eq([1])
    end
  end

  describe "#valid_move?" do
    it "can't move from an empty stack" do
      towers.valid_move?(1, 2).should be(false)
    end

    it "can move smaller piece onto bigger piece" do
      towers.valid_move?(0, 1).should be(true)
    end

    it "can't move bigger piece onto smaller piece" do
      towers.make_move(0, 1)
      towers.valid_move?(0, 1).should be(false)
    end

    it "must make a move" do
      towers.valid_move?(0, 0).should be(false)
    end
  end

  describe "#won?" do
    it "wins when it should" do
      towers.disks.times {towers.t2 << 1}
      towers.won?.should be(true)
    end
  end

end