class Flush < Rank
  def initialize(kickers)
    super("Flush")
    @kickers = kickers
  end

  def self.find_in(hand)
    straight = []
    has_flush = Suit.all.any? do |suit|
      cards_by_suit = hand.cards_by_suit(suit)
      straight = cards_by_suit.sort.reverse[0..4] if cards_by_suit.length >= 5
    end
    Flush.new(straight) if has_flush
  end

  def tie_breaking(other)
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

  def value
    5
  end

  protected
    attr_reader :kickers
  
end

