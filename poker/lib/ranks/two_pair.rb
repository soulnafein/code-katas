class TwoPair < Rank
  def initialize(first_pair, second_pair)
    @first_pair = Pair.new(first_pair)
    @second_pair = Pair.new(second_pair)
    super("Two Pair")
  end

  def self.find_in hand
    pairs = hand.tuples_with_length(2)
    TwoPair.new(pairs[0], pairs[1]) if pairs[0] and pairs[1]
  end

  def ==(other)
    other.instance_of? TwoPair
  end

  def value
    @first_pair.value+100
  end
end
