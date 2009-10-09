class Suit
  def initialize(description)
    @description = description
  end

  HEARTS = Suit.new("H")
  DIAMONDS = Suit.new("D")
  CLUBS = Suit.new("C")
  SPADES = Suit.new("S")

  def self.parse(suit_string)
    suit = all.select { |suit| suit.to_s == suit_string.downcase }.first
    raise UnknownSuitError, "I cannot find a suit for #{suit_string}" if not suit
    suit
  end

  def to_s
    @description.downcase
  end

  private
    def self.all
      Suit.constants.map { |suit| Suit.const_get(suit) }.select { |suit| suit.instance_of? Suit }      
    end
end

class UnknownSuitError < ArgumentError 
end