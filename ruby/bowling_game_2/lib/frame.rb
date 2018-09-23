class Frame
  attr_reader :next_frame, :rolls

  def initialize(next_frame: nil)
    @next_frame = next_frame
    @rolls = []
  end

  def add_roll(pins)
    @rolls << pins
  end

  def score
    @rolls.reduce(:+)
  end

  def complete?
    return false if last_frame?
    return true if strike?
    @rolls.length == 2
  end

  def last_frame?
    @next_frame.nil?
  end

  def strike?
    @rolls.first == 10
  end

  def next_two_rolls
  end
end
