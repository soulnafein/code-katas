class StraightFlush < Rank
  def initialize(face)
    super("Straight Flush", 9)
    @face = face
  end

  def self.find_in(hand)
    straights = Suit.all.map { |suit| Straight.find_in(hand.hand_by_suit(suit)) }.reject { |straight| straight.nil? }
    StraightFlush.new(straights.max.face) if straights.length > 0
  end

  include FaceTieBreaking
end

