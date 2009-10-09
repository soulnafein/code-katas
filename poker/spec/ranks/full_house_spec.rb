require 'spec/spec_helper.rb'

describe FullHouse do
  it "should recognise a full house" do
    hand = Hand.new("5h Ts Td 5h 3h 5s")

    FullHouse.find_in(hand).should == FullHouse.new(ThreeOfAKind.new(Face::FIVE), Pair.new(Face::TEN))
  end

end
