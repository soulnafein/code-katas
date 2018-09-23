class Poker < Rank
  def initialize(face)
    super("Poker", 8)
    @face = face
  end

  def self.find_in hand
    poker = hand.tuples_with_length(4)
    Poker.new(poker.first) if not poker.first.nil?
  end

  include FaceTieBreaking
end
