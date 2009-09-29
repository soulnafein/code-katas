class Ranking
  attr_reader :value

  def initialize(description, value)
    @description = description
    @value = value
  end

  STRAIGHT_FLUSH = Ranking.new("Straight Flush", 9)
  POKER = Ranking.new("Poker", 8)
  FULL_HOUSE = Ranking.new("Full House", 7)
  FLUSH = Ranking.new("Flush", 6)
  STRAIGHT = Ranking.new("Straight", 5)
  THREE_OF_A_KIND = Ranking.new("Three of a Kind", 4)
  TWO_PAIR = Ranking.new("Two Pair", 3)
  PAIR = Ranking.new("Pair", 2)
  HIGH_CARD = Ranking.new("High Card", 1)
  NOT_RANKED = Ranking.new("", 0)

  def to_s
    return @description
  end
end

