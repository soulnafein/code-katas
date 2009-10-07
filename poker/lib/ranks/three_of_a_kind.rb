class ThreeOfAKind < Rank
  def initialize
    super("Three of a Kind")
  end

  def self.find_in hand
    result = []
    result << ThreeOfAKind.new if hand.tuples_with_length(3) > 0
    result
  end

  def ==(other)
    other.instance_of? ThreeOfAKind 
  end

  def value
    3000
  end
end
