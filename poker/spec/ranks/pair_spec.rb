require 'spec/spec_helper.rb'

describe Pair do
  it "should return the highest pair" do
    hand = Hand.new("5h Ts Td 5h")

    Pair.find_in(hand).should == Pair.new(Face::TEN)
  end

  it "should be better than a lower pair" do
    Pair.new(Face::TEN).should > Pair.new(Face::EIGHT)
  end

  it "should be equal to a pair with the same face" do
    Pair.new(Face::TEN).should == Pair.new(Face::TEN)
  end
  
end
