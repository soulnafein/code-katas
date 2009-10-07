class Straight < Rank
  def initialize
    super("Straight")
  end

  def self.find_in hand
    cards = hand
    cards = hand.cards if hand.respond_to?(:cards)

    has_straight = Card::FACES.each_cons(5).any? do |straight|
      straight.all? do |face|
        face = "A" if face == "1"
        cards.any? { |card| card.face.to_s == face }
      end
    end

    result = []
    result << Straight.new if has_straight
    result
  end

  def ==(other)
    other.instance_of? Straight
  end

  def value
    4000
  end
end
