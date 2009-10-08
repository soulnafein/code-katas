class Face



  attr_reader :value

  def initialize(description, value)
    @description = description
    @value = value
  end

  TWO = Face.new("2", 2)
  THREE = Face.new("3", 3)
  FOUR = Face.new("4", 4)
  FIVE = Face.new("5", 5)
  SIX = Face.new("6", 6)
  SEVEN = Face.new("7", 7)
  EIGHT = Face.new("8", 8)
  NINE = Face.new("9", 9)
  TEN = Face.new("T", 10)
  JACK = Face.new("J", 11)
  QUEEN = Face.new("Q", 12)
  KING = Face.new("K", 13)
  ACE = Face.new("A", 14)

  def self.parse(face_string)
    face = all_faces.select { |face| face.to_s == face_string.capitalize }.first
    raise UnknownFaceError, "I cannot find a face for #{face_string}" if not face
    face
  end

  def ==(other)
    self.eql?(other)
  end

  def eql?(other)
    if other.instance_of? Face
      @value == other.value
    elsif false
    end
  end

  def hash
    @value
  end

  def to_s
    @description
  end

  include Comparable

  def <=>(other)
    @value <=> other.value
  end

  def self.all_combinations_of_five(&block)
    faces_including_lower_ace = all_faces << Face.new("1",1)
    faces_including_lower_ace.sort.each_cons(5, &block)
  end


  private
    def self.all_faces
      Face.constants.map { |face| Face.const_get(face) }.select { |face| face.instance_of? Face }
    end

end

class UnknownFaceError < ArgumentError
end