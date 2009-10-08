class Straight < Rank
  def initialize
    super("Straight")
  end

  def self.find_in hand
    cards = hand
    cards = hand.cards if hand.respond_to?(:cards)

    has_straight = Face.all_combinations_of_five.any? do |straight|
      straight.all? do |face|
        face = Face::ACE if face.to_s == "1"
        cards.any? { |card| card.face == face }
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
