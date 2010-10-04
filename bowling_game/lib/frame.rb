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
    @rolls.size >= max_number_of_rolls || strike?
  end

  def max_number_of_rolls
    2
  end

  def first_pins_down
    @rolls.first
  end

  def second_pins_down
    @rolls[1] || @next_frame.first_pins_down
  end

  protected
  def spare?
    sum_of_all_pins_down == 10
  end

  def strike?
    first_pins_down == 10
  end

  private
  def sum_of_all_pins_down
    @rolls.inject(&:+)
  end

  def spare_bonus
    spare? ? @next_frame.first_pins_down : 0
  end

  def strike_bonus
    strike? ? @next_frame.second_pins_down : 0
  end
end