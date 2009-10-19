require 'spec/spec_helper.rb'

describe ThreeOfAKind do
  it "should return the highest three of a kind" do
    hand = Hand.new("5h 5s Td 5h 3h 2s 4s")

    ThreeOfAKind.find_in(hand).should == ThreeOfAKind.new(Face::FIVE, Hand.new("Td 4s").cards)
  end

  it "should win on another three of a kind with lower face" do
    ThreeOfAKind.new(Face::TEN).should > ThreeOfAKind.new(Face::TWO)
  end

  it "should tie with a three of a kind with same face" do
    ThreeOfAKind.new(Face::TEN).should == ThreeOfAKind.new(Face::TEN)
  end

  it "should compare kickers when comparing an hand with same three of a kind" do
    winning_three_of_a_kind = ThreeOfAKind.new(Face::TEN, Hand.new("Jh Ad").cards)
    losing_three_of_a_kind = ThreeOfAKind.new(Face::TEN, Hand.new("Ad Th").cards)

    winning_three_of_a_kind.should > losing_three_of_a_kind
    losing_three_of_a_kind.should < winning_three_of_a_kind
  end

  it "should return a Three of a Kind without kickers" do
    ThreeOfAKind.new(Face::TEN, Hand.new("Jh Ad")).without_kickers.should == ThreeOfAKind.new(Face::TEN)
  end
end
