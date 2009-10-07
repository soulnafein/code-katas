class Face
  def self.parse(face_string)
    Face.new(FACES.index(face_string))
  end

  attr_reader :value

  FACES = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A" ]

  def ==(other)
    self.eql?(other)
  end

  def eql?(other)
     if other.instance_of? Face
       @value == other.value
    elsif
      false
    end
  end

  def hash
    @value
  end

  def to_s
    FACES[@value]
  end

  include Comparable

  def <=>(other)
    @value <=> other.value
  end

  private
    def initialize(value)
      @value = value
    end

end