Feature: Tie breaking rules

Scenario: The highest high card wins
Given I have the following hands:
      |       hand           |
      | Kh 2s Jh Ts 7d 5c 3c |
      | Qh 2s 8h Ts 7d 5c 3c |
When I ask for the results
Then I should see
"""
Kh 2s Jh Ts 7d 5c 3c High Card (winner)
Qh 2s 8h Ts 7d 5c 3c High Card

"""

Scenario: The highest pair wins
Given I have the following hands:
      |       hand           |
      | 6h 6s 8h Ts 7d 5c 3c |
      | 5h 5s Jh Ts 7d 2c 3c |
When I ask for the results
Then I should see
"""
6h 6s 8h Ts 7d 5c 3c Pair (winner)
5h 5s Jh Ts 7d 2c 3c Pair

"""

Scenario: The highest two pair wins
Given I have the following hands:
      |       hand           |
      | 5h 5s Ah As 7d 2c 3c |
      | 6h 6s Kh Ks 7d 2c 3c |
When I ask for the results
Then I should see
"""
5h 5s Ah As 7d 2c 3c Two Pair (winner)
6h 6s Kh Ks 7d 2c 3c Two Pair

"""

Scenario: Two two pair with same high pair
Given I have the following hands:
      |       hand           |
      | 6h 6s Ah As 7d 2c 3c |
      | 5h 5s Ah As 7d 2c 3c |
When I ask for the results
Then I should see
"""
6h 6s Ah As 7d 2c 3c Two Pair (winner)
5h 5s Ah As 7d 2c 3c Two Pair

"""

Scenario: The highest three of a kind's face wins
Given I have the following hands:
      |       hand           |
      | 6h 6s 6h 7s 2d 5c 3c |
      | 5h 5s Ah Ts 7d 5c 3c |
When I ask for the results
Then I should see
"""
6h 6s 6h 7s 2d 5c 3c Three of a Kind (winner)
5h 5s Ah Ts 7d 5c 3c Three of a Kind

"""

Scenario: The full-house with highest three of a kind wins
Given I have the following hands:
      |       hand           |
      | 6h 6s 6d 7s 5d 5c 3c |
      | 5h 5s Ah 5d 7d 7c 3c |
When I ask for the results
Then I should see
"""
6h 6s 6d 7s 5d 5c 3c Full House (winner)
5h 5s Ah 5d 7d 7c 3c Full House

"""

Scenario: Compare pair when two full-house have same three-of-a-kind
Given I have the following hands:
      |       hand           |
      | 6h 6s 6d 7s 8d 8c 3c |
      | 6h 6s Ah 6d 7d 7c 3c |
When I ask for the results
Then I should see
"""
6h 6s 6d 7s 8d 8c 3c Full House (winner)
6h 6s Ah 6d 7d 7c 3c Full House

"""

Scenario: The highest poker win
Given I have the following hands:
      |       hand           |
      | 6h 6s 6d 7s 6d 5c 3c |
      | 5h 5s Ah 5d 7d 5c 3c |
When I ask for the results
Then I should see
"""
6h 6s 6d 7s 6d 5c 3c Poker (winner)
5h 5s Ah 5d 7d 5c 3c Poker

"""