class Pair < Rank
  def initialize
    super("Pair")
  end

  def self.find_in hand
    result = []
    result << Pair.new if hand.tuples_with_length(2) > 0
    result
  end

  def ==(other)
    other.instance_of? Pair
  end

  def value
    2000
  end
end
