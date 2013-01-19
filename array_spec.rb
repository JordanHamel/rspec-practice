require 'rspec'
require_relative 'arrays'

describe "#my_uniq" do
  it "takes out the doubles" do
    my_uniq([1, 2, 1]).should eq([1, 2])
  end

  it "returns an empty array" do
    my_uniq([]).should eq ([])
  end

  it "returns an array that is already unique" do
    my_uniq([1, 2, 3]).should eq ([1, 2, 3])
  end

  it "returns an array of one element" do
    my_uniq([1]).should eq([1])
  end
end

describe Array do
  describe "#has_pair" do
    it "returns false on no pairs" do
      [1, 2, 3, 4].has_pair.should be(false)
    end

    it "returns true if array has pair" do
      [1, 2, 3, -1].has_pair.should be(true)
    end

    it "returns true if array has multiple pairs" do
      [1, 2, -2, -1].has_pair.should be(true)
    end

    it "returns false on empty array" do
      [].has_pair.should be(false)
    end
  end


end

