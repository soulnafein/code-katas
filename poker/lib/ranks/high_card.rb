class HighCard < Rank
  def initialize(face)
    @face = face
    super("High Card")
  end

  def self.find_in(hand)
    highest_card = hand.cards.sort.last
    HighCard.new(highest_card.face)
  end 

  def value
    1  
  end

  def tie_breaking(other_high_card)
    @face <=> other_high_card.face
  end

  protected
    attr_reader :face
end
