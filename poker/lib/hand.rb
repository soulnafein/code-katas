 class Hand
  attr_reader :cards

  def initialize(hand_string)
    @cards = hand_string.split(" ").map { |card| Card.new(card) }
    @face_frequencies = face_frequencies
  end

  def rank  
    return Fold.new if Fold.find_in(self).size > 0

    ranks = StraightFlush.find_in(self) +
            Poker.find_in(self) +
            FullHouse.find_in(self) +
            Flush.find_in(self) +
            Straight.find_in(self) +
            ThreeOfAKind.find_in(self)

    ranks << TwoPair.find_in(self) if TwoPair.find_in(self)
    ranks << Pair.find_in(self) if Pair.find_in(self)
    ranks << HighCard.find_in(self)

    ranks.sort.last
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

  def number_of_tuples_with_length(length)
    @face_frequencies.values.find_all { |l| l == length }.size 
  end

  def tuples_with_length(length)
    unsorted_array = @face_frequencies.find_all { |face, l| l == length }
    unsorted_array.map { |pair| pair.first }.sort.reverse
  end

  def cards_by_suit(suit)
    @cards.select { |card| card.suit == suit }
  end

  private

    def face_frequencies
      frequencies = Hash.new(0) 
      @cards.each { |card| frequencies[card.face] += 1 }
      return frequencies
    end
end
