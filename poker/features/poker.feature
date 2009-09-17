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

Scenario: Recognise Pair
Given I have the following hand "8h 7s 3d 8c 9s Qc Kh"
When I ask for the hand value
Then I should see "Pair"

Scenario: Recognise Two Pair
Given I have the following hand "8h 7s 3d 8c 9s 7c Kh"
When I ask for the hand value
Then I should see "Two Pair"

Scenario: Recognise Three of a Kind
Given I have the following hand "8h 7s 3d 8c 9s 8s Kh"
When I ask for the hand value
Then I should see "Three of a Kind"

Scenario: Recognise Straight
Given I have the following hand "8h 7s 3d 8c 9s Js Th"
When I ask for the hand value
Then I should see "Straight"

Scenario: Recognise Poker
Given I have the following hand "8h 7s 8d 8c 9s 8s Kh"
When I ask for the hand value
Then I should see "Poker"

