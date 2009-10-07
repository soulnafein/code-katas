class Fold < Rank
  def initialize
    super("")
  end

  def self.find_in(hand)
    result = []
    result << Fold.new if hand.cards.length < 7
    result
  end

  def ==(other)
    other.instance_of? Fold
  end

  def value
    0
  end
end
