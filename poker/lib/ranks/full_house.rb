class FullHouse < Rank
  def initialize
    super("Full House")
  end

  def self.find_in(hand)
    pair = Pair.find_in(hand)
    three_of_a_kind = ThreeOfAKind.find_in(hand)

    has_full_house = pair && three_of_a_kind.size > 0

    result = []
    result << FullHouse.new if has_full_house
    result
  end

  def ==(other)
    other.instance_of? FullHouse
  end

  def value
    6000
  end
end

