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
    (@first_pair.value == other.first_pair.value &&
    @second_pair.value == other.second_pair.value) ||
    (@second_pair.value == other.first_pair.value &&
    @first_pair.value == other.second_pair.value)        
  end

  def value
    @first_pair.value+100
  end

  protected
    attr_reader :first_pair, :second_pair
end
