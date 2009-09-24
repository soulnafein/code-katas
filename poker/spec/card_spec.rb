require_relative '../lib/card.rb'

describe Card do
  it "should be equal to a card with same suit and face" do
    card_1 = Card.new("Kh")
    card_2 = Card.new("Kh")
    card_3 = Card.new("Ks")

    card_1.should == card_2
    card_3.should_not == card_1
  end

  it "should be higher than card with lower face" do
    high_card = Card.new("Kh")
    low_card = Card.new("3h")

    high_card.should > low_card
    low_card.should < high_card
  end

  it "should tell me if it is a card's successor" do
    king = Card.new("Kh")
    queen = Card.new("Qs")
    ten = Card.new("10h")

    king.is_successor_of(queen).should == true
    ten.is_successor_of(king).should == false
    queen.is_successor_of(king).should == false
  end
end
