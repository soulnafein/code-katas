class TwoPair < Rank
  def initialize(first_pair, second_pair, kickers = [])
    @pairs = [first_pair, second_pair].sort
    @kickers = kickers
    super("Two Pair")
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
    attr_reader :kickers
  
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
        bottom_pair_comparison = bottom_pair <=> other.bottom_pair
        if bottom_pair_comparison == 0
          kickers_comparison(other)
        else
          bottom_pair_comparison
        end
      else
        top_pair_comparison
      end
    end

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
