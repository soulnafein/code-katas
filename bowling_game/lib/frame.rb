class Frame
  attr_reader :rolls

  def initialize
    @rolls = []
    @next_frame = nil
  end

  def set_roll(pins)
    raise ArgumentError if invalid_pin_number(pins)

    @rolls.push(Roll.new(pins))

    @rolls.push(Roll.new(0)) if pins == 10

    raise FrameFullNotification if @rolls.length == 2
  end

  def score
    pins_down + bonus
  end

  def next_frame=(value)
    @next_frame = value
  end

  def first_roll_pins_down
    @rolls[0].pins_down
  end

  def second_roll_pins_down
    if strike?
      @next_frame.first_roll_pins_down
    else
      @rolls[1].pins_down
    end
  end

  private
  def invalid_pin_number(pins)
    return true if not (pins.to_s =~ /^\d+$/)
    frame_total = pins_down + pins
    frame_total > 10
  end

  def bonus
    bonus = 0
    bonus += @next_frame.first_roll_pins_down if spare_or_strike?
    bonus += @next_frame.second_roll_pins_down if strike?
    bonus
  end

  def spare_or_strike?
    pins_down == 10
  end

  def pins_down
    @rolls.inject(0) { |sum, roll| sum + roll.pins_down }
  end

  def strike?
   @rolls.first.pins_down == 10
  end
end

class FrameFullNotification < Exception
end