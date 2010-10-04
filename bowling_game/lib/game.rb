class Game
  def initialize
    @frames = create_frames
    @current_frame = @frames.first
  end

  def roll(pins_down)
    go_to_next_frame if @current_frame.full?
    @current_frame.roll(pins_down)
  end

  def score
    @frames.inject(0) { |sum,frame| sum + frame.score }
  end

  private
  def create_frames
    frames = Array.new(9) { Frame.new } + [TenthFrame.new]
    frames.each_cons(2) { |pair| pair[0].next_frame = pair[1] }
    frames
  end

  def go_to_next_frame
    frame_number = @frames.index(@current_frame)
    @current_frame = @frames[frame_number+1]
  end
end