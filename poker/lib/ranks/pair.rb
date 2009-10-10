class Pair < Rank
  def initialize(face)
    @face = face
    super("Pair")
  end

  def self.find_in hand
    pairs = hand.tuples_with_length(2)
    Pair.new(pairs.first) if not pairs.first.nil?  
  end

  def value
    2
  end

  def tie_breaking(other_pair)
    @face <=> other_pair.face
  end

  protected
    attr_reader :face
end
