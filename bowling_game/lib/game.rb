class Game
  attr_reader :frames, :current_frame

  def initialize
    @frames = []
    10.times do
      new_frame = Frame.new
      previous_frame = @frames.last
      previous_frame.next_frame = new_frame if previous_frame
      @frames.push(new_frame)
    end
    @current_frame = 1
  end

  def roll(pins)
    begin
      @frames[@current_frame - 1].set_roll(pins)
    rescue FrameFullNotification
      @current_frame += 1
    end
  end

  def score
    @frames.inject(0) { |sum, frame| sum + frame.score }
  end
end