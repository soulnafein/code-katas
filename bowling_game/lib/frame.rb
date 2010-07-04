class Frame
  def initialize
    @rolls = []
  end

  def next_frame=(frame)
    @next_frame = frame
  end

  def roll(pins_down)
    @rolls.push(pins_down)
  end

  def score
    sum_of_all_pins_down + spare_bonus + strike_bonus
  end

  def full?
    @rolls.size >= 2 || strike?
  end

  def first_pins_down
    @rolls.first
  end

  def second_pins_down
    @rolls[1] || @next_frame.first_pins_down
  end

  private
  def sum_of_all_pins_down
    @rolls.inject(&:+)
  end

  def spare?
    sum_of_all_pins_down == 10
  end

  def strike?
    spare? && first_pins_down == 10
  end

  def spare_bonus
    spare? ? @next_frame.first_pins_down : 0
  end

  def strike_bonus
    strike? ? @next_frame.second_pins_down : 0
  end
end