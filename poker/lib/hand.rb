class Hand
  attr_reader :cards

  def initialize(cards)
    if cards.respond_to?(:split)
      @cards = cards.split(" ").map { |card| Card.new(card) }
    else
      @cards = cards
    end
    @face_frequencies = face_frequencies
  end

  def rank
    return Fold.new if Fold.find_in(self)
    find_highest_rank
  end

  include Comparable

  def <=>(other)
    rank <=> other.rank
  end

  def ==(other)
    if other.instance_of? Hand
      @cards.all? { |card| other.cards.include? card }
    elsif false
    end
  end
  
  def to_s
    @cards.join(" ")
  end

  def number_of_tuples_with_length(length)
    @face_frequencies.values.find_all { |l| l == length }.size
  end

  def tuples_with_length(length)
    unsorted_array = @face_frequencies.find_all { |face, l| l == length }
    unsorted_array.map { |pair| pair.first }
  end

  def hand_by_suit(suit)
    Hand.new(@cards.select { |card| card.suit == suit })
  end

  def contains_faces?(faces)
    hand_faces = @cards.map { |card| card.face }.to_set
    faces.to_set.subset?(hand_faces)
  end

  private

  def face_frequencies
    frequencies = Hash.new(0)
    @cards.each { |card| frequencies[card.face] += 1 }
    return frequencies
  end

  def find_highest_rank
    poker_ranks = [
            StraightFlush,
            Poker,
            Flush,
            FullHouse,
            Straight,
            ThreeOfAKind,
            TwoPair,
            Pair,
            HighCard
    ]

    hand_ranks = poker_ranks.map { |class_name| class_name.find_in(self) }
    hand_ranks.reject { |rank| rank.nil? }.max
  end
end
