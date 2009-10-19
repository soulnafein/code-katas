class Pair < Rank
  def initialize(face, kickers = [])
    @face = face
    @kickers = kickers
    super("Pair")
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
    face_comparison = @face <=> other_pair.face
    if face_comparison == 0
      kickers_comparison(other_pair)
    else
      face_comparison
    end
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
end
