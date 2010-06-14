require "spec/spec_helper"
Rspec.configure do |config|
  # Remove this line if you don't want Rspec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include Rspec::Matchers
  config.mock_with :rspec
end

describe "My behaviour" do

  it "should play 13 turns" do
    game = Yahtzee.new_game
    turn = mock :turn
    Turn.stub!(:new).and_return(turn)

    turn.should_receive(:playx).exactly(13).times
  
  end
end