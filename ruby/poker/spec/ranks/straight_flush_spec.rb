require 'spec/spec_helper.rb'

describe StraightFlush do
  it "should recognise the highest straight flush" do
    hand = Hand.new("5h 7h 2h 4h 3h 6h Ah")

    StraightFlush.find_in(hand).should == StraightFlush.new(Face::SEVEN)
  end

  it "should win over a lower straight" do
    StraightFlush.new(Face::EIGHT).should < StraightFlush.new(Face::JACK)
  end
end
