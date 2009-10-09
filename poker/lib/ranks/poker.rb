class Poker < Rank
  def initialize(face)
    super("Poker")
    @face = face
  end

  def self.find_in hand
    poker = hand.tuples_with_length(4)
    Poker.new(poker.first) if not poker.first.nil?
  end

  def tie_breaking(other)
    @face <=> other.face
  end

  def value
    7000
  end

  protected
    attr_reader :face
end
