class Fold < Rank
  def initialize
    super("")
  end

  def self.find_in(hand)
    Fold.new if hand.cards.length < 7
  end

  def ==(other)
    other.instance_of? Fold
  end

  def value
    0
  end
end
