class HighCard < Rank
  def initialize(face)
    @face = face
    super("High Card", 1)
  end

  def self.find_in(hand)
    HighCard.new(hand.cards.max.face)
  end 

  include FaceTieBreaking
end
