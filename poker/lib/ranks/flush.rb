class Flush < Rank
  def initialize(kickers)
    super("Flush", 6, kickers)
  end

  def self.find_in(hand)
    straight = []
    has_flush = Suit.all.any? do |suit|
      cards_by_suit = hand.hand_by_suit(suit).cards
      straight = cards_by_suit.sort.reverse[0..4] if cards_by_suit.length >= 5
    end
    Flush.new(straight) if has_flush
  end
end

