class ThreeOfAKind < Rank
  def initialize(face, kickers = [])
    super("Three of a Kind", kickers)
    @face = face
  end

  def self.find_in hand
    three_of_a_kind = hand.tuples_with_length(3).first
    kickers = hand.cards.reject { |card| card.face == three_of_a_kind }.sort.reverse[0..1]
    ThreeOfAKind.new(three_of_a_kind, kickers) if not three_of_a_kind.nil?  
  end

  def without_kickers
    ThreeOfAKind.new(@face)
  end

   def value
    3
  end

  protected
    attr_reader :face
   


  def tie_breaking(other)
    face_comparison = @face <=> other.face
  end
end
