require "spec/spec_helper"

describe Dice do
  it "should return the Nth die" do
    dice = Dice.a_set_of 5

    dice[3].class.should == Die
    dice[5].should be_nil
  end

  it "should roll all the dice not hold" do
    dice = Dice.a_set_of 5
    mock_result_of_dice(dice, [1,5,6,7,7])

    dice.roll
    dice.hold "5 7 1"

    new_roll = dice.roll

    new_roll.number_of(1).should == 0
    new_roll.number_of(7).should == 1
  end
end