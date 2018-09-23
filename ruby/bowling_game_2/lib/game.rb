class Game
  def initialize
    @frames = setup_frames(10)
    @current_frame = @frames.first
  end

  def score
    scores = @frames.map(&:score)
    scores.reduce(0,:+)
  end

  def roll(pins)
    prepare_next_frame if current_frame.complete?
    current_frame.add_roll(pins)
  end

  private

  attr_reader :current_frame

  def setup_frames(how_many)
    return [Frame.new] if how_many == 1
    rest = setup_frames(how_many-1)
    [Frame.new(next_frame: rest.first)] + rest
  end

  def next_two_rolls(frames)
    frames.flat_map(:rolls).take(2)
  end

  def prepare_next_frame
    @current_frame = @current_frame.next_frame
  end
end
