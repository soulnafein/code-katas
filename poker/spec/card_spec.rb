require_relative '../lib/card.rb'

describe Card do
  it "should be equal to a card with same suit and face" do
    card_1 = Card.new("Kh")
    card_2 = Card.new("Kh")
    card_3 = Card.new("Ks")

    card_1.should == card_2
    card_3.should_not == card_1
  end
end
