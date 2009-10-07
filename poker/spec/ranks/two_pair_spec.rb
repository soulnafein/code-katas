require 'spec/spec_helper.rb'

describe TwoPair do
  it "should return the two highest pairs" do
    hand = Hand.new("5h Ts Td 5h 3h 3s")

    TwoPair.find_in(hand).should == TwoPair.new(Face.parse("T"), Face.parse("5"))
  end

  #it "should be better than a lower high card" do
  #  HighCard.new(Face.parse("T")).should > HighCard.new(Face.parse("8"))
  #end
end
