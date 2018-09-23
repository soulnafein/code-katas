require File.dirname(__FILE__) + '/spec_helper'

describe "How to calculate bowling score" do
  it "should be a total score of 0 for a gutter game" do
    game = BowlingGame.new
    20.times { game.roll(0) }
    game.score.should == 0
  end

  it "should be the total of the pins down for a game without bonus" do
    game = BowlingGame.new
    20.times { game.roll(4) }
    game.score.should == 80
  end

  it "should give add the next roll to the score of a spare" do
    game = BowlingGame.new
    16.times { game.roll(0) }
    2.times { game.roll(5) }
    1.times { game.roll(2)}
    1.times { game.roll(7)}
    game.score.should == 21
  end
end

describe Frame do
  it "should have a score as the total of its rolls" do
    frame = Frame.new
    frame.roll(2)
    frame.roll(5)
    frame.score.should == 7
  end
end