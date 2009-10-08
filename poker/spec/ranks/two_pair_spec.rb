require 'spec/spec_helper.rb'

describe TwoPair do
  it "should return the two highest pairs" do
    hand = Hand.new("5h Ts Td 5h 3h 3s")

    TwoPair.find_in(hand).should == TwoPair.new(Face::TEN, Face::FIVE)
  end

  it "should be better than a lower high card" do
    HighCard.new(Face::TEN).should > HighCard.new(Face::EIGHT)
  end

  it "should be equal to a two pair with same faces" do
     HighCard.new(Face::TEN).should == HighCard.new(Face::TEN)     
  end
end
