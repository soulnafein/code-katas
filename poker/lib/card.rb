class Card
  attr_reader :suit, :face

  def initialize(card_string)
    @face = Face.parse(card_string[0].chr)  
    @suit = card_string[1].chr
  end

  def ==(other)
    if other.instance_of? Card
      @suit.eql?(other.suit) && (@face == other.face)
    elsif
      false
    end
  end

  def hash
    @suit + @face
  end

  def to_s
    @face.to_s + @suit
  end

  FACES = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A" ]

  SUITS = [ "h", "d", "c", "s" ]

  include Comparable

  def <=>(other)
    @face.value <=> other.face.value
  end
end
