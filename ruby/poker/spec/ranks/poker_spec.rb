require 'spec/spec_helper.rb'

describe Poker do
  it "should return the highest poker" do
    hand = Hand.new("5h 5s Td 5d 3h 5c")

    Poker.find_in(hand).should == Poker.new(Face::FIVE)
  end

  it "should win on another poker with lower face" do
    Poker.new(Face::TEN) > Poker.new(Face::TWO)
  end
  
end
