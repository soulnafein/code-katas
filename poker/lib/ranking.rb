  class Ranking
    def initialize(description)
      @description = description
    end

    STRAIGHT_FLUSH = Ranking.new("Straight Flush")
    POKER = Ranking.new("Poker")
    FULL_HOUSE = Ranking.new("Full-House")
    FLUSH = Ranking.new("Flush")
    STRAIGHT = Ranking.new("Straight")
    THREE_OF_A_KIND = Ranking.new("Three of a Kind")
    TWO_PAIR = Ranking.new("Two Pair")
    PAIR = Ranking.new("Pair")
    HIGH_CARD = Ranking.new("High Card")

    def to_s
      return @description
    end
  end

