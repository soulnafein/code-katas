require 'spec/spec_helper.rb'

describe TwoPair do
  before(:each) do
    @pair_of_ten = Pair.new(Face::TEN)
    @pair_of_five = Pair.new(Face::FIVE)
    @pair_of_two = Pair.new(Face::TWO)
    @pair_of_nine = Pair.new(Face::NINE)
    @pair_of_jack = Pair.new(Face::JACK)
    @pair_of_four = Pair.new(Face::FOUR)
  end

  it "should return the two highest pairs" do
    hand = Hand.new("5h Ts Td 5h 3h 7s 8s")

    TwoPair.find_in(hand).should == TwoPair.new(@pair_of_ten, @pair_of_five, [Card.new("8s")])
  end

  it "should be equal to another two pair with same pairs" do
    TwoPair.new(@pair_of_ten, @pair_of_five).should == TwoPair.new(@pair_of_five, @pair_of_ten)
  end

  it "should win on another two pair with same top pair, but lower bottom pair" do
    TwoPair.new(@pair_of_ten, @pair_of_five).should > TwoPair.new(@pair_of_four, @pair_of_ten)
  end

  it "should win on another two pair with lower top pair" do
    TwoPair.new(@pair_of_jack, @pair_of_two).should > TwoPair.new(@pair_of_ten, @pair_of_nine)
  end

  it "should compare kickers when comparing with a two pair with same top and bottom pair" do
    winning_two_pair = TwoPair.new(@pair_of_jack, @pair_of_two, Hand.new("Ah").cards)
    losing_two_pair = TwoPair.new(@pair_of_jack, @pair_of_two, Hand.new("Kh").cards)

    winning_two_pair.should > losing_two_pair
    losing_two_pair.should < winning_two_pair
  end

  it "should return a Pair without kickers" do
    Pair.new(Face::TEN, Hand.new("Jh Ad 9h 3d 2s")).without_kickers.should == Pair.new(Face::TEN)
  end

end
