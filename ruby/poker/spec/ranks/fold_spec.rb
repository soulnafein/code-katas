require 'spec/spec_helper.rb'

describe Fold do
  it "should recognise if an hand has been folded" do
    Fold.find_in(Hand.new("Ah 3s")).should == Fold.new
  end

  it "should be equal to another fold" do
    Fold.new.should == Fold.new
    (Fold.new <=> Fold.new).should == 0
  end
end
