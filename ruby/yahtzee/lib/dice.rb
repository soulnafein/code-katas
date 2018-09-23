require File.expand_path("lib/die")

class Dice
  def self.a_set_of(n)
    Dice.new(n)
  end

  def initialize(n)
    @dice = []
    n.times { @dice << Die.new }
    @hold_dice = []
  end

  def roll
    @dice.each { |die| die.roll }
    Roll.new(@dice)
  end

  def hold dice_to_hold
    values_to_find = dice_to_hold.split ' '
    values_to_find.each do |value|
      die_to_hold = @dice.find { |d| d.face_up == value.to_i }
      hold_die die_to_hold
    end
  end

  def [](index)
    @dice[index]
  end

  def each(&block)
    yield block
  end

  private

  def hold_die die
    @dice.delete die
    @hold_dice << die
  end
end