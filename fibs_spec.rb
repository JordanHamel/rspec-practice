require 'rspec'
require_relative 'fibs'

describe "#fibonacci" do 

  it "returns first fib number" do
    fibs_rec(1).should == [0]
  end

  it "returns the first two fib numbers" do
    fibs_rec(2).should == [0,1]
  end

  it "returns several fib numbers" do
    fibs_rec(5).should == [0, 1, 1, 2, 3]
  end

  it "calls itself recursively" do
    should_receive(:fibs_rec).at_least(:twice).and_call_original
    fibs_rec(5)
  end

end