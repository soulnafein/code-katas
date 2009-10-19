require 'spec/spec_helper.rb'

describe FullHouse do
  it "should recognise a full house" do
    hand = Hand.new("5h Ts Td 5h 3h 5s")

    FullHouse.find_in(hand).should == FullHouse.new(ThreeOfAKind.new(Face::FIVE), Pair.new(Face::TEN))
  end

  it "should win on a full-house with lower three of a kind" do
    full_house_of_ten_and_five = FullHouse.new(ThreeOfAKind.new(Face::TEN), Pair.new(Face::FIVE))
    full_house_of_nine_and_six = FullHouse.new(ThreeOfAKind.new(Face::NINE), Pair.new(Face::SIX))
    full_house_of_nine_and_six.should < full_house_of_ten_and_five
  end

  it "should win on a full-house with the same three of a kind and a lower pair" do
    full_house_of_ten_and_five = FullHouse.new(ThreeOfAKind.new(Face::TEN), Pair.new(Face::FIVE))
    full_house_of_ten_and_six = FullHouse.new(ThreeOfAKind.new(Face::TEN), Pair.new(Face::SIX))
    full_house_of_ten_and_six.should > full_house_of_ten_and_five
  end

  it "should not consider kickers when comparing full-house with same three of a kind and pair" do
    full_house = FullHouse.new(ThreeOfAKind.new(Face::TEN, "Jh"), Pair.new(Face::FIVE, "Jh Th Td 9h 7d"))
    another_full_house = FullHouse.new(ThreeOfAKind.new(Face::TEN, "9h"), Pair.new(Face::FIVE, "6h Th Td 9h 2d"))

    full_house.should == another_full_house
  end
end
