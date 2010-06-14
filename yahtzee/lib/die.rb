class Die
  attr_reader :face_up
  
  def initialize
    @face_up = 6
  end

  def roll
    @face_up = 1+rand(6)
  end
end