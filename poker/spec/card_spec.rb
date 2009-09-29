require 'spec/spec_helper.rb'

describe Card do
  it "should be equal to a card with same suit and face" do
    card_1 = Card.new("Kh")
    card_2 = Card.new("Kh")
    card_3 = Card.new("Ks")

    card_1.should == card_2
    card_3.should_not == card_1
  end

  it "should be printable" do
    Card.new("Kh").to_s.should == "Kh"
  end
end
