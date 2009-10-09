class Flush < Rank
  def initialize
    super("Flush")
  end

  def self.find_in(hand)
    has_flush = Suit.all.any? do |suit|
      hand.cards_by_suit(suit).length >= 5
    end
    flushes = []
    flushes << Flush.new if has_flush
    flushes
  end

  def ==(other)
    other.instance_of? Flush
  end

  def value
    5000
  end
end

