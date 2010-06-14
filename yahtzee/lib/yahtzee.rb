require 'lib/user_interface'
require 'lib/dice'
require 'lib/roll'

class Yahtzee
  def self.new_game
    Yahtzee.new
  end

  def initialize
    @ui = UserInterface.new
    @dice = Dice.a_set_of 5
  end

  def start
    13.times { play_turn }
  end

  def play_turn
    3.times { roll_and_hold }
  end

  private
  def roll_and_hold
    roll = @dice.roll
    puts roll.display
    dice_to_hold = @ui.ask_question "Which dice would you like to hold (e.g. 2 3 3)"
    @dice.hold dice_to_hold
  end
end