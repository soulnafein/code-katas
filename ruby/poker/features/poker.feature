Feature: Texas Hold'Em match score calculator

Scenario: A round with 6 players
Given I have the following hands:
|     hand             |
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

