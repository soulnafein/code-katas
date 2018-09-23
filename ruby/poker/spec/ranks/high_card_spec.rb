require 'spec/spec_helper.rb'

describe HighCard do
  it "should return the highest card in an hand" do
    hand = Hand.new("Jh Ts Td Kh")
    HighCard.find_in(hand).should == HighCard.new(Face::KING)
  end

  it "should be better than a lower high card" do
    HighCard.new(Face::TEN).should > HighCard.new(Face::EIGHT)
  end

  it "should be equal to another high card with same face" do
    HighCard.new(Face::TEN).should == HighCard.new(Face::TEN)
  end
end
