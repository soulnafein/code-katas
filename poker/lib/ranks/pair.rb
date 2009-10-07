class Pair < Rank
  def initialize(face)
    @face = face
    super("Pair")
  end

  def self.find_in hand
    pairs = hand.tuples_with_length(2)
    Pair.new(pairs.first) if not pairs.first.nil?  
  end

  def ==(other)
    other.instance_of? Pair
  end

  def value
    100 + @face.value
  end
end
