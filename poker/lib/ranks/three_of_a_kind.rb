class ThreeOfAKind < Rank
  def initialize(face)
    super("Three of a Kind")
    @face = face
  end

  def self.find_in hand
    three_of_a_kind = hand.tuples_with_length(3)
    ThreeOfAKind.new(three_of_a_kind.first) if not three_of_a_kind.first.nil?  
  end

  def tie_breaking(other)
    @face <=> other.face
  end

  def value
    4
  end

  protected
    attr_reader :face
end
