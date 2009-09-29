require 'lib/card.rb'
require 'lib/ranking.rb'

class Hand
  attr_reader :cards

  def initialize(hand_string)
    @cards = hand_string.split(" ").map { |card| Card.new(card) }
    @face_frequencies = face_frequencies
  end

  def rank
    return Ranking::NOT_RANKED if @cards.length < 7
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

  include Comparable

  def <=>(other)
    rank.value <=> other.rank.value
  end

  def ==(other)
    if other.instance_of? Hand
      @cards.all? { |card| other.cards.include? card }
    elsif
      false
    end
  end

  def hash
    0
  end

  def to_s
    separator = ""
    result = ""
    @cards.each do |card|
      result += separator + card.to_s
      separator = " "
    end
    result
  end

  private

    def face_frequencies
      frequencies = Hash.new(0) 
      @cards.each { |card| frequencies[card.face] += 1 }
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

    def contains_full_house?
      contains_pair? and contains_three_of_a_kind? 
    end

    def contains_poker?
      tuples_with_length(4) > 0
    end

    def tuples_with_length(length)
      @face_frequencies.values.find_all { |l| l == length }.size 
    end

    def contains_flush?
      Card::SUITS.any? do |suit|
        cards_by_suit(suit).length >= 5
      end
    end

    def contains_straight?(cards=@cards)
      Card::FACES.each_cons(5).any? do |straight|
        straight.all? do |face|
          face = "A" if face == "1"
          cards.any? { |card| card.face == face }
        end
      end
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
