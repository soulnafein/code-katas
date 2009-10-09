require 'spec/spec_helper.rb'

describe Suit do

  it "should find a suit based on a character" do
    Suit.parse("h").should == Suit::HEARTS
    Suit.parse("S").should == Suit::SPADES
  end

  it "should complain if it can't parse a suit" do
    lambda {Suit.parse("10")}.should raise_error(UnknownSuitError)
  end

  it "should give me a list of all the suits" do
    suits = Suit.all
    suits.size.should == 4
    suits.include?(Suit::HEARTS).should == true
    suits.include?(Suit::DIAMONDS).should == true
    suits.include?(Suit::SPADES).should == true
    suits.include?(Suit::CLUBS).should == true
  end
end
