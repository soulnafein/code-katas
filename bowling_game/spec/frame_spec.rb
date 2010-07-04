require 'spec/spec_helper'

describe Frame do
  context "When calculating the score of a frame" do
    it "should sum all the pins down" do
      frame = Frame.new

      frame.roll(5)
      frame.roll(3)

      frame.score.should == 8
    end

    it "should sum the first roll of the next frame in case of a spare" do
      next_frame = Frame.new
      next_frame.roll(5)
      frame = Frame.new
      frame.next_frame = next_frame
      frame.roll(8)
      frame.roll(2)

      frame.score.should == 15
    end

    it "should sum also the second roll of the next frame in case of a strike" do
      next_frame = Frame.new
      next_frame.roll(5)
      next_frame.roll(2)
      frame = Frame.new
      frame.next_frame = next_frame
      frame.roll(10)

      frame.score.should == 17
    end

    it "should sum the first roll of the second subsequent frame when one strike follow another" do
      first_frame = Frame.new
      first_frame.roll(10)
      second_frame = Frame.new
      second_frame.roll(10)
      third_frame = Frame.new
      third_frame.roll(3)
      first_frame.next_frame = second_frame
      second_frame.next_frame = third_frame

      first_frame.score.should == 23
    end
  end

  it "should be full after two rolls" do
    frame = Frame.new
    frame.roll(3)
    frame.roll(2)

    frame.full?.should be_true
  end

  it "should not be full after a single roll" do
    frame = Frame.new
    frame.roll(6)

    frame.full?.should be_false
  end

  it "should be full in case of a strike" do
    frame = Frame.new
    frame.roll(10)

    frame.full?.should be_true
  end
end