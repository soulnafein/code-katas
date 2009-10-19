require 'spec/spec_helper.rb'

describe Flush do
  it "should recognise the highest flush" do
    hand = Hand.new("Jh 7h Kh 8h 3h Th Ah")

    Flush.find_in(hand).should == Flush.new(Hand.new("Jh Th Ah Kh 8h").cards)
    Flush.find_in(hand).should_not == Flush.new(Hand.new("Kh Th 9h Ah 7h").cards)
  end

  it "should win over a lower flush" do
    low_flush = Flush.new(Hand.new("Ad Td 7d 3d 2d").cards)
    high_flush = Flush.new(Hand.new("Ts 7s 4s As 2s").cards)
    
    low_flush.should < high_flush
    high_flush.should > low_flush
  end

  it "should be equal to a flush with same faces and different suits" do
    Flush.new(Hand.new("Ah Th Kh 2h 3h").cards).should == Flush.new(Hand.new("Ts Ks 3s 2s As").cards)
  end
end
