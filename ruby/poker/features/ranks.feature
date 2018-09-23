Feature: Recognise poker hand ranks

Scenario Outline: Identifiy poker hand ranking
    Given I have the following hand "<hand>"
    When I ask for the hand value
    Then I should see "<ranking>"

    Examples:
      |          hand        |      ranking    |
      | 8h 3d Js 2h As Tc    |                 |
      | 8h 7s Jd As 3s Qh 9s | High Card       |
      | 8h 7s 3d 8c 9s Qc Kh | Pair            |
      | 8h 7s 3d 8c 9s 7c Kh | Two Pair        |
      | 8h 7s 3d 8c 9s 8s Kh | Three of a Kind |
      | 8h 7s 3d 8c 9s Js Th | Straight        |
      | 8h 7s 8s 3c 9s 7s Ks | Flush           |
      | 8h 7s 8d 8c 9s 7h Kh | Full House      |
      | 8h 7s 8d 8c 9s 8s Kh | Poker           |
      | 8h 7s 8s 3c 9s 6s Ts | Straight Flush  |

Scenario: Pair stronger than High Card
Given I have the following hands:
      |         hand         |
      | 8h 7s Jd As 3s Qh 9s |
      | 8h 7s 3d 8c 9s Qc Kh |
When I ask for the results
Then I should see
"""
8h 7s Jd As 3s Qh 9s High Card
8h 7s 3d 8c 9s Qc Kh Pair (winner)

"""

Scenario: Two Pair stronger than Pair
Given I have the following hands:
      |         hand         |
      | 8h 7s 3d 8c 9s Qc Kh |
      | 8h 7s 3d 8c 9s 7c Kh |
When I ask for the results
Then I should see
"""
8h 7s 3d 8c 9s Qc Kh Pair
8h 7s 3d 8c 9s 7c Kh Two Pair (winner)

"""

Scenario: Three of a Kind stronger than Two Pair
Given I have the following hands:
      |         hand         |
      | 8h 7s 3d 8c 9s Qc Kh |
      | 8h 7s 3d 8c 9s 8s Kh |
When I ask for the results
Then I should see
"""
8h 7s 3d 8c 9s Qc Kh Pair
8h 7s 3d 8c 9s 8s Kh Three of a Kind (winner)

"""

Scenario: Straight stronger than Three of a Kind
Given I have the following hands:
      |         hand         |
      | 8h 7s 3d 8c 9s 8s Kh |
      | 8h 7s 3d 8c 9s Js Th |
When I ask for the results
Then I should see
"""
8h 7s 3d 8c 9s 8s Kh Three of a Kind
8h 7s 3d 8c 9s Js Th Straight (winner)

"""

Scenario: Flush stronger than Straight
Given I have the following hands:
      |         hand         |
      | 8h 7s 3d 8c 9s Js Th |
      | 8h 7s 8s 3c 9s 7s Ks |
When I ask for the results
Then I should see
"""
8h 7s 3d 8c 9s Js Th Straight
8h 7s 8s 3c 9s 7s Ks Flush (winner)

"""

Scenario: Full house stronger than Flush
Given I have the following hands:
      |         hand         |
      | 8h 7s 8s 3c 9s 7s Ks |
      | 8h 7s 8d 8c 9s 7h Kh |
When I ask for the results
Then I should see
"""
8h 7s 8s 3c 9s 7s Ks Flush
8h 7s 8d 8c 9s 7h Kh Full House (winner)

"""

Scenario: Poker stronger than Full House
Given I have the following hands:
      |         hand         |
      | 8h 7s 8d 8c 9s 7h Kh |
      | 8h 7s 8d 8c 9s 8s Kh |
When I ask for the results
Then I should see
"""
8h 7s 8d 8c 9s 7h Kh Full House
8h 7s 8d 8c 9s 8s Kh Poker (winner)

"""

Scenario: Straight Flush stronger than Poker
Given I have the following hands:
      |         hand         |
      | 8h 7s 8d 8c 9s 8s Kh |
      | 8h 7s 8s 3c 9s 6s Ts |
When I ask for the results
Then I should see
"""
8h 7s 8d 8c 9s 8s Kh Poker
8h 7s 8s 3c 9s 6s Ts Straight Flush (winner)

"""
