require 'spec/spec_helper.rb'

describe Hand do
  it "should give me a list of cards" do
    hand = Hand.new("Kc 9d")
    hand.cards.should include(Card.new("Kc"))
    hand.cards.should include(Card.new("9d"))
  end

  it "should create a new hand from a list of cards" do
    hand = Hand.new([Card.new("Kh"), Card.new("Ts")])
    hand.cards.should include(Card.new("Kh"))
    hand.cards.should include(Card.new("Ts"))
  end

  it "should be lower than an hand with a stronger rank" do
    three_of_a_kind = Hand.new("Kh 3d Ts 3h 3s Jh As")
    a_losing_three_of_a_kind = Hand.new("Kh 2d Ts 2h 2s Jh As")
    pair = Hand.new("Kh 3d Ts 2h 3s Jh As")
    straight = Hand.new("Kh 3d Ts Qh 3s Jh As")

    three_of_a_kind.should > pair
    three_of_a_kind.should < straight
    straight.should > pair
    a_losing_three_of_a_kind.should < three_of_a_kind
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
    hand.rank.instance_of?(HighCard).should == true
  end

  it "should recognise pairs in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d Jc 2d")
    hand.rank.should == Pair.new(Face::SEVEN, Hand.new("Kc Qc Jc").cards)
  end

  it "should recognise two pairs in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d 5c 2d")
    hand.rank.should == TwoPair.new(Pair.new(Face::SEVEN), Pair.new(Face::FIVE), [Card.new("Kc")])
  end

  it "should recognise three of a kind in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d 7h 2d")
    hand.rank.should == ThreeOfAKind.new(Face::SEVEN, Hand.new("Kc Qc").cards)
  end

  it "should recognise a straight in an hand" do
    hand = Hand.new("Th 7c Qc 8c Td 9h Jd")
    hand.rank.should == Straight.new(Face::QUEEN)
  end

  it "should recognise a lower ACE straight" do
    hand = Hand.new("Ah 2d 3h 4h 5s Jd Qc")
    hand.rank.should == Straight.new(Face::FIVE)
  end

  it "should recognise a flush in an hand" do
    hand = Hand.new("5h 7s Qs As 7d 5s 2s")
    hand.rank.should == Flush.new(Hand.new("7s Qs As 5s 2s").cards)
  end

  it "should recognise a full house in an hand" do
    hand = Hand.new("5h 7c Qc 7s 7d 5d 2d")
    hand.rank.should == FullHouse.new(ThreeOfAKind.new(Face::SEVEN), Pair.new(Face::FIVE))
  end

  it "should recognise a poker in an hand" do
    hand = Hand.new("5h 7c Qc 7s 7d 7h 2d")
    hand.rank.should == Poker.new(Face::SEVEN)
  end

  it "should recognise a straight flush in an hand" do
    hand = Hand.new("5h 3d Js 7d 4d 6d 5d")
    hand.rank.should == StraightFlush.new(Face::SEVEN)
  end

  it "should give me the number of all the tuples of a certain length" do
    hand = Hand.new("5h 7c Qc Kc 7d 5c 2d")

    hand.number_of_tuples_with_length(2).should == 2
    hand.number_of_tuples_with_length(3).should == 0
  end

  it "should give me all the faces that appear a certain number of times" do
    hand = Hand.new("5h 7c Qc Kc 7d 5c 2d")

    hand.tuples_with_length(2).should == [Face::SEVEN, Face::FIVE]
    hand.tuples_with_length(3).should == []
  end

  it "should give me a hand with only cards of the specified suit" do
    hand = Hand.new("5h 7c Qc Kc 7d 5c 2d")
    hand_of_clubs = hand.hand_by_suit(Suit::CLUBS)
    hand_of_clubs.should == Hand.new("7c Qc 5c Kc")
  end

  it "should tell me if it contains the specified faces" do
    hand = Hand.new("2h 3c 4c Kc 7d 5c 2d")
    hand.contains_faces?([Face::SEVEN, Face::FOUR]).should == true
    hand.contains_faces?([Face::SEVEN, Face::ACE]).should == false
  end
end
