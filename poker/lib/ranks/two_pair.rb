class TwoPair < Rank
  def initialize
    super("Two Pair")
  end

  def self.find_in hand
    result = []
    result << TwoPair.new if hand.tuples_with_length(2) > 1
    result
  end

  def ==(other)
    other.instance_of? TwoPair
  end

  def value
    3000
  end
end
