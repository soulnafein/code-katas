class Frame
  attr_reader :rolls

  def initialize
    @rolls = []
    @next_frame = nil
  end

  def set_roll(pins)
    raise ArgumentError if invalid_pin_number(pins)

    @rolls.push(Roll.new(pins))

    @rolls << nil if pins == 10

    raise FrameFullNotification if @rolls.length == 2
  end

  def score
    pins_down + bonus
  end

  def next_frame=(value)
    @next_frame = value
  end

  def first_roll_pins_down
    @rolls[0].score
  end

  private
  def invalid_pin_number(pins)
    return true if not (pins.to_s =~ /^\d+$/)
    frame_total = pins_down + pins
    frame_total > 10
  end

  def bonus
    bonus = 0
    bonus += @next_frame.first_roll_pins_down if pins_down == 10
    bonus
  end

  def pins_down
    @rolls.inject(0) { |sum, roll| sum + roll.score }
  end
end

class FrameFullNotification < Exception
end