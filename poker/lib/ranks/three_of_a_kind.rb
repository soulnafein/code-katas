class ThreeOfAKind < Rank
  def initialize(face, kickers = [])
    super("Three of a Kind")
    @face = face
    @kickers = kickers
  end

  def self.find_in hand
    three_of_a_kind = hand.tuples_with_length(3).first
    kickers = [hand.cards.reject { |card| card.face == three_of_a_kind }.sort.reverse.first]
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
    attr_reader :kickers

  private
  def kickers_comparison(other)
    faces = @kickers.map { |card| card.face }
    other_faces = other.kickers.map { |card| card.face }
    top_card = (faces - other_faces).sort.last
    other_top_card = (other_faces - faces).sort.last
    if top_card && other_top_card
      top_card <=> other_top_card
    else
      0
    end
  end

  def tie_breaking(other)
    face_comparison = @face <=> other.face
    if face_comparison == 0
      kickers_comparison(other)
    else
      face_comparison
    end
  end
end
