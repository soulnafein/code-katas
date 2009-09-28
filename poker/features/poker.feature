Feature: Texas Hold'Em match score calculator

Scenario: A round with 6 players
Given I that I have the following hands:
|     Hands            |
| Kc 9s Ks Kd 9d 3c 6d |
| 9c Ah Ks Kd 9d 3c 6d |
| Ac Qc Ks Kd 9d 3c    |
| 9h 5s                |
| 4d 2d Ks Kd 9d 3c 6d |
| 7s Ts Ks Kd 9d       |
When I ask for the results
Then I should see
"""
    Kc 9s Ks Kd 9d 3c 6d Full House (winner)
    9c Ah Ks Kd 9d 3c 6d Two Pair 
    Ac Qc Ks Kd 9d 3c
    9h 5s
    4d 2d Ks Kd 9d 3c 6d Flush
    7s Ts Ks Kd 9d
"""
Scenario Outline: Identifiy poker hand ranking 
    Given I have the following hand "<hand>" 
    When I ask for the hand value 
    Then I should see "<ranking>"

    Examples:
      |          hand        |      ranking    |
      | 8h 7s Jd As 3s Qh 9s | High Card       |
      | 8h 7s 3d 8c 9s Qc Kh | Pair            |
      | 8h 7s 3d 8c 9s 7c Kh | Two Pair        |
      | 8h 7s 3d 8c 9s 8s Kh | Three of a Kind |
      | 8h 7s 3d 8c 9s Js Th | Straight        |
      | 8h 7s 8d 8c 9s 7h Kh | Full-House      |
      | 8h 7s 8s 3c 9s 7s Ks | Flush           |
      | 8h 7s 8d 8c 9s 8s Kh | Poker           |
      | 8h 7s 8s 3c 9s 6s Ts | Straight Flush  |

