class Flush < Rank
  def initialize(kickers)
    super("Flush")
    @kickers = kickers
  end

  def self.find_in(hand)
    straight = []
    has_flush = Suit.all.any? do |suit|
      cards_by_suit = hand.cards_by_suit(suit)
      straight = cards_by_suit.sort.reverse[0..4] if cards_by_suit.length >= 5
    end
    Flush.new(straight) if has_flush
  end
 
  def value
    5
  end
end

