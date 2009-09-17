  class Ranking
    def initialize(value, description)
      @value = value, @description = description
    end

    POKER = Ranking.new(6, "Poker")
    FULL_HOUSE = Ranking.new(5, "Full-House")
    STRAIGHT = Ranking.new(4, "Straight")
    THREE_OF_A_KIND = Ranking.new(3, "Three of a Kind")
    TWO_PAIR = Ranking.new(2, "Two Pair")
    PAIR = Ranking.new(1, "Pair")

    def to_s
      return @description
    end
  end

