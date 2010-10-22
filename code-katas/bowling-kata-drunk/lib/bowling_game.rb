class BowlingGame
  def initialize
    @frames = Array.new(10) { Frame.new }
    @frames.each_cons(2) { |pair| pair[0].next_frame = pair[1]}
    @current_frame = @frames.first
  end

  def roll(pins_down)
    next_frame if @current_frame.full?
    @current_frame.roll(pins_down)
  end

  def score
    @frames.inject(0) { |total, f| total + f.score }
  end

  private
  def next_frame
    @current_frame = @current_frame.next_frame
  end
end

class Frame
  def initialize
    @rolls = []
  end

  attr_accessor :next_frame

  def roll(pins_down)
    @rolls.push(pins_down)
  end

  def full?
    @rolls.size >= 2
  end

  def score
    @rolls.inject(0,:+) + spare_bonus
  end

  private
  def spare_bonus

  end
end