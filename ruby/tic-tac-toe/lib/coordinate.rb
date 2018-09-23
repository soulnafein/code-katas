class Coordinate
  def initialize(x,y)
    @x,@y = x,y
  end

  def self.at(x,y)
    Coordinate.new(x,y)
  end

  def to_i
    (3*@y)+@x
  end
end