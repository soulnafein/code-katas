class Card
  attr_reader :suit, :face

  def initialize(card_string)
    @face = card_string[0]
    @suit = card_string[1]
  end

  def is_successor_of(card)
    FACES[@face] == FACES[card.face]+1
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

  FACES = {
            "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
            "6" => 6, "7" => 7, "8" => 8, "9" => 9, "T" => 10,
            "J" => 11, "Q" => 12, "K" => 13, "A" => 14
          }

  SUITS = [ "h", "d", "c", "s" ]

  include Comparable

  def <=>(other)
    value = FACES[@face] <=> FACES[other.face]
  end
end
