class Card
  attr_reader :suit, :face

  def initialize(card_string)
    @face = card_string[0]
    @suit = card_string[1]
  end

  def ==(other)
    if other.instance_of? Card
      @suit.eql?(other.suit) && @face.eql?(other.face)
    elsif
      false
    end
  end

  def hash
    @suit * 100 + @face
  end
end
