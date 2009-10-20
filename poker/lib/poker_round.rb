class PokerRound
  def initialize(hands)
    @hands = hands
  end

  def results
    @hands.reduce("") do |result, hand|
      winner = " (winner)" if hand == winner_hand
      rank = " #{hand.rank}" unless hand.rank.to_s.empty?
      result << "#{hand}#{rank}#{winner}\n"
    end
  end

  def winner_hand
    @hands.max
  end
end
