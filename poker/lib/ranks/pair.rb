class Pair < Rank
  def initialize(face, kickers = [])
    @face = face
    super("Pair", kickers)
  end

  def self.find_in hand
    pair = hand.tuples_with_length(2).first
    kickers = hand.cards.reject { |card| card.face == pair }

    Pair.new(pair, kickers) if not pair.nil?
  end

  def value
    2
  end

  def tie_breaking(other_pair)
    @face <=> other_pair.face
  end

  def without_kickers
    Pair.new(@face)
  end

  protected
  attr_reader :face

end
