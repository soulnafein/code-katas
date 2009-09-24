require_relative './card.rb'
require_relative './ranking.rb'

class Hand
  attr_reader :cards

  def initialize(hand_string)
    @cards = []
    hand_string.split(" ").each do |card|
      @cards << Card.new(card)
    end
    @face_frequencies = face_frequencies
  end

  def score
    return Ranking::STRAIGHT_FLUSH if contains_straight_flush?
    return Ranking::POKER if contains_poker?
    return Ranking::FULL_HOUSE if contains_full_house?
    return Ranking::FLUSH if contains_flush?
    return Ranking::STRAIGHT if contains_straight?
    return Ranking::THREE_OF_A_KIND  if contains_three_of_a_kind?
    return Ranking::TWO_PAIR if contains_two_pairs?
    return Ranking::PAIR if contains_pair?
    return Ranking::HIGH_CARD
  end

  private

    def face_frequencies
      frequencies = Hash.new
      @cards.each do |card|
        face = card.face
        if frequencies.include? face
          frequencies[face] += 1
        else
          frequencies[face] = 1
        end
      end
      return frequencies
    end

    def contains_pair?
      tuples_with_length(2) > 0
    end

    def contains_two_pairs?
      tuples_with_length(2) > 1
    end

    def contains_three_of_a_kind?
      tuples_with_length(3) > 0
    end

    def contains_flush?
      Card::SUITS.any? do |suit|
        cards_by_suit(suit).length >= 5
      end
    end

    def contains_full_house?
      contains_pair? and contains_three_of_a_kind? 
    end

    def contains_poker?
      tuples_with_length(4) > 0
    end

    def tuples_with_length(length)
      @face_frequencies.values.find_all { |l| l == length }.size 
    end


    def contains_straight?(cards=@cards)
      Card::FACES.keys.each_cons(5).any? do |straight|
        straight.all? do |face| 
          face = "A" if face == "1"
          has_cards_with_same_face(face) and 
          cards.any? { |card| card.face == face }
        end
      end
    end

    def has_cards_with_same_face(face)
      @face_frequencies[face]
    end

    def contains_straight_flush?
      Card::SUITS.any? do |suit|
        contains_straight?(cards_by_suit(suit))
      end
    end

    def cards_by_suit(suit)
      @cards.select { |card| card.suit == suit }
    end
end
