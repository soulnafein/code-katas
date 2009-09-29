class Card
  attr_reader :suit, :face

  def initialize(card_string)
    @face = card_string[0].chr
    @suit = card_string[1].chr
  end

  def ==(other)
    if other.instance_of? Card
      @suit.eql?(other.suit) && @face.eql?(other.face)
    elsif
      false
    end
  end

  def hash
    @suit + @face
  end

  def to_s
    @face + @suit
  end

  FACES = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A" ]

  SUITS = [ "h", "d", "c", "s" ]
end
