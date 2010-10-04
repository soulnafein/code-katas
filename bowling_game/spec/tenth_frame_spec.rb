require_relative 'spec_helper'

describe TenthFrame do
  context "When calculating the score of a frame" do
    it "should allow three rolls in the case of a strike" do
      frame = TenthFrame.new
      frame.roll(10)
      frame.roll(6)
      frame.full?.should be_false
      frame.roll(4)
      frame.full?.should be_true
    end

    it "should only provide two rolls in a normal scenario" do
      frame = TenthFrame.new
      frame.roll(6)
      frame.roll(2)
      frame.full?.should be_true
    end
  end
end