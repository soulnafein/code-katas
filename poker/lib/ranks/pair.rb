class Pair < Rank
  def initialize(face, kickers = [])
    @face = face
    super("Pair", 2, kickers)
  end

  def self.find_in hand
    pair = hand.tuples_with_length(2).first
    kickers = hand.cards.reject { |card| card.face == pair }

    Pair.new(pair, kickers.sort.reverse[0..2]) if not pair.nil?
  end
  
  include FaceTieBreaking

  def without_kickers
    Pair.new(@face)
  end

end
