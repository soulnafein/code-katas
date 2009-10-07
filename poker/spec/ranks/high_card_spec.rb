require 'spec/spec_helper.rb'

describe HighCard do
  it "should return the highest card in an hand" do
    hand = Hand.new("Jh Ts Td Kh")

    HighCard.find_in(hand).should == HighCard.new(Face.parse("T"))
  end

  it "should be better than a lower high card" do
    HighCard.new(Face.parse("T")).should > HighCard.new(Face.parse("8"))
  end
end
