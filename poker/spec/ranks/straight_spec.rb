require 'spec/spec_helper.rb'

describe Straight do
  it "should recognise the highest straight" do
    hand = Hand.new("5h 7s 2d 4h 3h 6s As")

    Straight.find_in(hand).should == Straight.new(Face::SEVEN)
  end

  it "should win over a lower straight" do
    Straight.new(Face::EIGHT).should < Straight.new(Face::JACK)
  end
end
