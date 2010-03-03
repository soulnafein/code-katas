Feature: Show grid
  In order to play tic tac toe
  As a player
  I want to see a grid with the O or X I have placed

  Scenario: Empty grid
    Given a new tic tac toe game
    When is the first turn
    Then I should see the following output
      """
         |   |   
      -----------
         |   |   
      -----------
         |   |   

      """

  Scenario: Show O and X on the grid
    Given a new tic tac toe game
    And the following moves being played:
      | x | y |
      | 0 | 1 |
      | 2 | 1 |
      | 2 | 2 |
      | 0 | 2 |
      | 1 | 0 |
      | 1 | 1 |
    When is the next turn
    Then I should see the following output
    """
       | O |   
    -----------
     O | X | X 
    -----------
     X |   | O 

    """
