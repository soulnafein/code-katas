require 'spec/spec_helper.rb'

describe TwoPair do
  it "should return the two highest pairs" do
    hand = Hand.new("5h Ts Td 5h 3h 3s")

    TwoPair.find_in(hand).should == TwoPair.new(Face::TEN, Face::FIVE)
  end

  it "should be equal to another two pair with same pairs" do
    TwoPair.new(Face::TEN, Face::FIVE).should == TwoPair.new(Face::FIVE, Face::TEN)  
  end
end
