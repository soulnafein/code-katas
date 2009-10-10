require 'spec/spec_helper.rb'

describe ThreeOfAKind do
  it "should return the highest three of a kind" do
    hand = Hand.new("5h 5s Td 5h 3h 2s")

    ThreeOfAKind.find_in(hand).should == ThreeOfAKind.new(Face::FIVE)
  end

  it "should win on another three of a kind with lower face" do
    ThreeOfAKind.new(Face::TEN).should > ThreeOfAKind.new(Face::TWO)
  end

  it "should tie with a three of a kind with same face" do
    ThreeOfAKind.new(Face::TEN).should == ThreeOfAKind.new(Face::TEN)
  end
end
