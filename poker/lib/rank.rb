class Rank
  def initialize(description, value, kickers = [])
    @description = description
    @value = value
    @kickers = kickers
  end
 
  include Comparable

  def <=>(other)
    compare_rank = lambda {value <=> other.value}
    apply_tie_breaking_rules = lambda {tie_breaking(other)}
    compare_kickers = lambda {kickers_comparison(other)}

    in_order_to_decide_winner_rank(
            compare_rank,
            apply_tie_breaking_rules,
            compare_kickers)
  end
 
  def to_s
    @description
  end

  protected
  attr_reader :kickers, :value

  private
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
    faces = get_faces(@kickers)
    other_faces = get_faces(other.kickers)

    top_card = get_max_unique_face(faces, other_faces)
    other_top_card = get_max_unique_face(other_faces, faces)

    if top_card && other_top_card
      top_card <=> other_top_card
    else
      0
    end
  end

  def get_faces(cards)
    cards.map { |card| card.face }
  end

  def get_max_unique_face(array1, array2)
    ((array1 - array2) << Face::TWO).max
  end

end
