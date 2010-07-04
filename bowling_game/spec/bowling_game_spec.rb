require "spec_helper"

describe "Bowling score calculation" do
  before :each do
    @game = Game.new
  end

  it "should calculate a score 0 for a gutter game" do
    pins_rolled [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
    @game.score.should == 0
  end

  it "should sum all the pins rolled down in the game" do
    pins_rolled [[4,4],[4,4],[4,4],[4,4],[4,4],[4,4],[4,4],[4,4],[4,4],[4,4]]
    @game.score.should == 80
  end

  it "should give bonus for spares" do
    pins_rolled [[0,0],[0,0],[6,4],[7,2],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
    @game.score.should == 26
  end

  it "should give bonus for strikes" do
    pins_rolled [[0,0],[0,0],[0,0],[0,0],[10],[10],[7,3],[1,4],[0,0],[0,0]]
    @game.score.should == 63
  end

  def pins_rolled(frames)
    frames.each do |frame|
      frame.each do |pins_down|
        @game.roll(pins_down)
      end
    end
  end
end
