class Poker < Rank
  def initialize
    super("Poker")
  end

  def self.find_in(hand)
    result = []
    result << Poker.new if hand.tuples_with_length(4) > 0
    result
  end

  def ==(other)
    other.instance_of? Poker
  end

  def value
    7000
  end
end
