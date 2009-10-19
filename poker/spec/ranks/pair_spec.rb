require 'spec/spec_helper.rb'

describe Pair do
  it "should return the highest pair" do
    hand = Hand.new("5h Ts Td 5s 8s 7d")

    Pair.find_in(hand).should == Pair.new(Face::TEN, Hand.new("5h 5s 8s 7d").cards)
  end

  it "should be better than a lower pair" do
    Pair.new(Face::TEN).should > Pair.new(Face::EIGHT)
  end

  it "should compare kickers when comparing with same pair" do
    winning_pair = Pair.new(Face::TEN, Hand.new("8h 4d 3s").cards)
    losing_pair = Pair.new(Face::TEN, Hand.new("2d 8h 4s").cards)

    winning_pair.should > losing_pair
    losing_pair.should < winning_pair
  end

  it "should be equal to a pair with the same face" do
    Pair.new(Face::TEN).should == Pair.new(Face::TEN)
  end
  
end
