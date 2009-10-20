class Straight < Rank
  def initialize(face)
    super("Straight")
    @face = face
  end

  def self.find_in hand
    cards = hand.cards

    Face.all_combinations_of_five.each do |straight|
      has_straight = straight.all? do |face|
        face = Face::ACE if face.to_s == "1"
        cards.any? { |card| card.face == face }
      end
      return Straight.new(straight.first) if has_straight
    end
  end

  def value
    4
  end

  def tie_breaking(other)
    @face <=> other.face
  end

  attr_reader :face
end
