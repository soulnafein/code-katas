require 'spec/spec_helper.rb'

describe Hand do
  it "should give me a list of cards" do
    hand = Hand.new("Kc 9d")
    hand.cards.should include(Card.new("Kc"))
    hand.cards.should include(Card.new("9d"))
  end

  it "should be lower than an hand with a stronger rank" do
    three_of_a_kind = Hand.new("Kh 3d Ts 3h 3s Jh As")
    pair = Hand.new("Kh 3d Ts 2h 3s Jh As")
    straight = Hand.new("Kh 3d Ts Qh 3s Jh As")

    three_of_a_kind.should > pair
    three_of_a_kind.should < straight
    straight.should > pair
  end

  it "should be equal to an hand with same cards" do
    Hand.new("Kh").should == Hand.new("Kh")
    Hand.new("Td").should_not == Hand.new("3s")
  end

  it "should show all cards when printed" do
    Hand.new("Kh Jd Th").to_s.should == "Kh Jd Th"
  end

  it "should not be ranked if contains less than 7 cards" do
    hand_with_less_than_7_cards = Hand.new("5h 3d 6s 4d 3h 3s")

    hand_with_less_than_7_cards.rank.should == Fold.new
  end

  it "should recognise high card in an hand" do
    hand = Hand.new("5h 7c Qc Kc Ad Jc 2d")
    hand.rank.should == HighCard.new
  end

  it "should recognise pairs in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d Jc 2d")
    hand.rank.should == Pair.new
  end

  it "should recognise two pairs in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d 5c 2d")
    hand.rank.should == TwoPair.new
  end

  it "should recognise three of a kind in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d 7h 2d")
    hand.rank.should == ThreeOfAKind.new
  end

  it "should recognise a straight in an hand" do
    hand = Hand.new("Th 7c Qc 8c 10d 9h Jd")
    hand.rank.should == Straight.new 
  end

  it "should recognise a lower ACE straight" do
    hand = Hand.new("Ah 2d 3h 4h 5s Jd Qc")
    hand.rank.should == Straight.new
  end

  it "should recognise a flush in an hand" do
    hand = Hand.new("5h 7s Qs As 7d 5s 2s")
    hand.rank.should == Flush.new
  end

  it "should recognise a full house in an hand" do
    hand = Hand.new("5h 7c Qc 7s 7d 5d 2d")
    hand.rank.should == FullHouse.new
  end

  it "should recognise a poker in an hand" do
    hand = Hand.new("5h 7c Qc 7s 7d 7h 2d")
    hand.rank.should == Poker.new
  end

  it "should recognise a straight flush in an hand" do
    hand = Hand.new("5h 3d Js 7d 4d 6d 5d")
    hand.rank.should == StraightFlush.new
  end

end
