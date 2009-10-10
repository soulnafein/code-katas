class FullHouse < Rank
  def initialize(three_of_a_kind, pair)
    super("Full House")
    @three_of_a_kind = three_of_a_kind
    @pair = pair
  end

  def self.find_in(hand)
    pair = Pair.find_in(hand)
    three_of_a_kind = ThreeOfAKind.find_in(hand)

    has_full_house = pair && three_of_a_kind
    FullHouse.new(three_of_a_kind, pair) if has_full_house
  end

  def ==(other)
    three_of_a_kind == other.three_of_a_kind and
    pair == other.pair
  end

  def tie_breaking(other)
    three_of_a_kind_comparison = three_of_a_kind <=> other.three_of_a_kind
    if three_of_a_kind_comparison == 0
      pair <=> other.pair
    else
      three_of_a_kind_comparison
    end
  end

  def value
    6000
  end

  protected
    attr_reader :three_of_a_kind, :pair
end

