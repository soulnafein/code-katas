class TwoPair < Rank
  def initialize(first_pair, second_pair, kickers = [])
    @pairs = [first_pair, second_pair].sort
    super("Two Pair", kickers)
  end

  def self.find_in hand
    pairs = hand.tuples_with_length(2)
    kickers = hand.cards.reject{ |card| card.face == pairs[0] || card.face == pairs[1] }
    kickers = [kickers.sort.reverse.first]

    TwoPair.new(Pair.new(pairs[0]), Pair.new(pairs[1]), kickers) if pairs[0] and pairs[1]
  end

  def value
    3
  end

  protected
  def bottom_pair
    @pairs[0]
  end

  def top_pair
    @pairs[1]
  end

  private
  def tie_breaking(other)
    top_pair_comparison = top_pair <=> other.top_pair
    if top_pair_comparison == 0
      bottom_pair <=> other.bottom_pair
    else
      top_pair_comparison
    end
  end

end
