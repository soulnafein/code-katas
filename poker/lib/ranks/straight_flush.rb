class StraightFlush < Rank
  def initialize
    super("Straight Flush")
  end

  def self.find_in(hand)
    has_straight_flush = Card::SUITS.any? do |suit|
      Straight.find_in(hand.cards_by_suit(suit)).size > 0
    end

    result = []
    result << StraightFlush.new if has_straight_flush
    result
  end

  def ==(other)
    other.instance_of? StraightFlush
  end

  def value
    8000
  end
end

