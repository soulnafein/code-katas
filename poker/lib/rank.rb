class Rank
  def initialize(description, kickers = [])
    @description = description
    @kickers = kickers
  end

  def to_s
    @description
  end

  include Comparable

  def <=>(other)
    compare_rank = lambda {value <=> other.value}
    tie_breaking_rules = lambda { tie_breaking(other)}
    compare_kickers = lambda { kickers_comparison(other)}
    
    in_order_to_decide_winner_rank(
            compare_rank,
            tie_breaking_rules,
            compare_kickers)
  end

  def in_order_to_decide_winner_rank(*predicates)
    predicates.each do |predicate|
      result = predicate.call
      return result unless result == 0
    end
    0
  end

  def tie_breaking(other)
    0
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

  attr_reader :kickers

end
