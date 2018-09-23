Feature: Game endings
  In order to have fun
  As a player
  I want to know if I won, lost or tied the game

  Scenario: Tris horizontal
    Given a new tic tac toe game
    And the following moves being played:
      | x | y |
      | 0 | 0 |
      | 1 | 2 |
      | 1 | 0 |
      | 2 | 2 |
    When a token is placed at "2,0"
    Then I should see "Player 1 won!"

  Scenario: Tris vertical
    Given a new tic tac toe game
    And the following moves being played:
      | x | y |
      | 0 | 0 |
      | 1 | 2 |
      | 2 | 1 |
      | 1 | 0 |
      | 0 | 1 |
    When a token is placed at "1,1"
    Then I should see "Player 2 won!"

  Scenario: Tris diagonal
    Given a new tic tac toe game
    And the following moves being played:
      | x | y |
      | 0 | 0 |
      | 1 | 2 |
      | 1 | 1 |
      | 1 | 0 |
    When a token is placed at "2,2"
    Then I should see "Player 1 won!"

  Scenario: Draw
    Given a new tic tac toe game
    And the following moves being played:
      | x | y |
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 1 |
      | 2 | 1 |
      | 2 | 2 |
      | 1 | 2 |
      | 0 | 2 |
    When a token is placed at "1,1"
    Then I should see "Draw!"
