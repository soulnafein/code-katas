require "spec/spec_helper"

describe Die do

  it "should have a default face up of 6" do
    die = Die.new
    die.face_up.should == 6
  end

  it "should throw the dice randomly" do
    die = Die.new
    die.should_receive(:rand).with(6).and_return(0)

    die.roll

    die.face_up.should == 1
  end

end