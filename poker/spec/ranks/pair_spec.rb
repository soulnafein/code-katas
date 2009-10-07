require 'spec/spec_helper.rb'

describe Pair do
  it "should return the highest pair" do
    hand = Hand.new("5h Ts Td 5h")

    Pair.find_in(hand).should == Pair.new(Face.parse("T"))
  end

  it "should be better than a lower pair" do
    Pair.new(Face.parse("T")).should > Pair.new(Face.parse("8"))
  end
end
