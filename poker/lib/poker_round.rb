class PokerRound
  def initialize(hands)
    @hands = hands
  end

  def results
    results = ""
    @hands.each do |hand|
      winner = " (winner)" if hand == winner_hand
      rank = " #{hand.rank}" unless hand.rank.to_s.empty?
      results << "#{hand}#{rank}#{winner}\n"
    end
    results
  end

  def winner_hand
    @hands.sort.last
  end
end
