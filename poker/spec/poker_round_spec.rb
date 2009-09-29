require 'lib/poker_round.rb'
require 'lib/hand.rb'

describe PokerRound do
  it "should tell us the hand with the highest rank" do
    hand_with_two_pair = Hand.new("Jh As Js Qd Ah 3s 2d")
    hand_with_poker = Hand.new("Jh As Js Jd Ah 3s Jc")
    hand_with_flush = Hand.new("Jh As Js Qh Ah 3h 2h")
    hands = [hand_with_two_pair, hand_with_poker, hand_with_flush]

    poker_round = PokerRound.new(hands)

    poker_round.winner_hand.should == hand_with_poker
  end

  it "should show all the hands and the winner" do
    hand_with_two_pair = Hand.new("Jh As Js Qd Ah 3s 2d")
    hand_with_poker = Hand.new("Jh As Js Jd Ah 3s Jc")
    hand_with_flush = Hand.new("Jh As Js Qh Ah 3h 2h")
    hands = [hand_with_two_pair, hand_with_poker, hand_with_flush]

    poker_round = PokerRound.new(hands)

    expected_results =  "Jh As Js Qd Ah 3s 2d Two Pair\n" +
                        "Jh As Js Jd Ah 3s Jc Poker (winner)\n" +
                        "Jh As Js Qh Ah 3h 2h Flush\n"

    poker_round.results.should == expected_results
  end
end
