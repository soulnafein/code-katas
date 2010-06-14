require "spec/spec_helper"

describe "When rolling" do

  before(:each) do
    @game = Game.new
  end

  it "should record my score for the current roll and current frame" do
    @game.roll(3)
    @game.frames[0].rolls[0].score.should == 3
  end

  it "should change current frame every two rolls" do
    @game.roll(4)
    @game.roll(5)
    @game.roll(1)

    @game.current_frame.should == 2
    @game.frames[1].rolls[0].score.should == 1
  end

  it "should move to the next frame if a strike is scored" do
    @game.roll(10)
    @game.current_frame.should == 2
  end

  it "should raise an error when the sum of the rolls is more than 10" do
    @game.roll(3)
    lambda { @game.roll(8) }.should raise_error ArgumentError
  end

  it "should raise an error when an invalid pin number is passed" do
    lambda { @game.roll(-9) }.should raise_error ArgumentError
    lambda { @game.roll('boob') }.should raise_error ArgumentError
  end
end

describe "When asking for the score" do
  before(:each) do
    @game = Game.new
  end

  it "should be 0 for a gutter game" do
    20.times {@game.roll(0)}

    @game.score.should == 0
  end

  it "should be the sum all the pins for a game without strikes or spares" do
    20.times {@game.roll(4)}

    @game.score.should == 80  
  end

  it "should give bonus for a spare" do

    14.times {@game.roll(0)}

    @game.roll(3)
    @game.roll(1)
    @game.roll(3)
    @game.roll(7)
    @game.roll(3)
    @game.roll(4)

    @game.score.should == 24
    
  end

  it "should give bonus for strike" do
    14.times {@game.roll(0)}

    @game.roll(3)
    @game.roll(1)
    @game.roll(10)
    @game.roll(3)
    @game.roll(4)

    @game.score.should == 28
  end
end