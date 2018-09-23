require "rspec"
require "rspec/mocks"
require "rspec/expectations"
require "lib/dice"
require "lib/die"
require "lib/yahtzee"
require "lib/roll"
require "lib/turn"
require "lib/user_interface"

def mock_result_of_dice(dice, digits)
  digits.each_with_index do |digit, index|
    dice[index].should_receive(:roll).and_return(digit)
    dice[index].should_receive(:face_up).and_return(digit)
  end
end

