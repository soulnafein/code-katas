class Card
  attr_reader :suit, :face

  def initialize(card_string)
    @face = Face.parse(card_string[0].chr)  
    @suit = Suit.parse(card_string[1].chr)
  end

  def ==(other)
    if other.instance_of? Card
      @suit.eql?(other.suit) && (@face == other.face)
    elsif
      false
    end
  end

  def to_s
    @face.to_s + @suit.to_s
  end

  include Comparable

  def <=>(other)
    @face <=> other.face
  end
end
