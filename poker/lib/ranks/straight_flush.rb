class StraightFlush < Rank
  def initialize(face)
    super("Straight Flush")
    @face = face
  end

  def self.find_in(hand)

    straights = Suit.all.map { |suit| Straight.find_in(hand.hand_by_suit(suit)) }.reject { |straight| straight.nil? }
    straights.inspect
 
    StraightFlush.new(straights.sort.first) if straights.length > 0
  end

  def ==(other)
    other.instance_of? StraightFlush
  end

  def value
    8
  end

  include FaceTieBreaking
    
end

