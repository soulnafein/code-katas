require 'spec'
require_relative '../lib/hand.rb'

describe Hand do
  it "should give me a list of cards" do
    hand = Hand.new("Kc 9d")
    hand.cards.should include(Card.new("Kc"))
    hand.cards.should include(Card.new("9d"))
  end

  it "should recognise high card in an hand" do
    hand = Hand.new("5h 7c Qc Kc Ad Jc 2d")
    hand.score.should == Ranking::HIGH_CARD
  end

  it "should recognise pairs in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d Jc 2d")
    hand.score.should == Ranking::PAIR
  end

  it "should recognise two pairs in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d 5c 2d")
    hand.score.should == Ranking::TWO_PAIR
  end

  it "should recognise three of a kind in an hand" do
    hand = Hand.new("5h 7c Qc Kc 7d 7h 2d")
    hand.score.should == Ranking::THREE_OF_A_KIND
  end

  it "should recognise a straight in an hand" do
    hand = Hand.new("Th 7c Qc 8c 10d 9h Jd")
    hand.score.should == Ranking::STRAIGHT
  end

  it "should recognise a lower ACE straight" do
    hand = Hand.new("Ah 2d 3h 4h 5s Jd Qc")
    hand.score.should == Ranking::STRAIGHT
  end

  it "should recognise a flush in an hand" do
    hand = Hand.new("5h 7s Qs As 7d 5s 2s")
    hand.score.should == Ranking::FLUSH
  end

  it "should recognise a full house in an hand" do
    hand = Hand.new("5h 7c Qc 7s 7d 5d 2d")
    hand.score.should == Ranking::FULL_HOUSE
  end

  it "should recognise a poker in an hand" do
    hand = Hand.new("5h 7c Qc 7s 7d 7h 2d")
    hand.score.should == Ranking::POKER
  end

  it "should recognise a straigh flush in an hand" do
    hand = Hand.new("5h 3d Js 7d 4d 6d 5d")
    hand.score.should == Ranking::STRAIGHT_FLUSH
  end

end
