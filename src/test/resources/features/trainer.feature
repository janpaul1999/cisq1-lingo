Feature: Galgje
  As a User,
  I want to be abled to play a game of galgje,
  In order to test my galgje skills to practice for the real thing

  Scenario: User starts a game
    When the User starts a game
    Then a random 5,6 or 7 letter word gets generated

  Scenario: User attempt to guess the word
    When the User guesses a word
    Then the game will check if any letters are on the corresponding spots
    Given a letter is on the correct place
    Then the letter will be market correct
    Given a letter is in the word but not on the correct spot
    Then the letter will be marked as correct but not correctly placed
    Given a letter is not in the word
    Then the letter will be marked as incorrect

  Scenario: User doesn't guess the word before the turns run out
    When the User guessed the maximum amount of available times
    Given the User doesn't guess the word within those turns
    Then the game is considered as lost

  Scenario: User guesses the word before the turns run out
    When the user guesses the correct word
    Then the game is considered won

  Scenario Outline: Start a new round
    Given I am playing a game
    And the round was won
    And the last word had "<previous length>" letters
    When I start a new round
    Then the word to guess has "<next length>" letters

    Examples:     | previous length | next length |
                  | 5               | 6           |
                  | 6               | 7           |
                  | 7               | 5           |
    # Failure path
    Given I am playing a game
    And the round was lost
    Then I cannot start a new round

  Scenario Outline: Guessing a word
    Given the User tried to "<guess>" the "<word>"
    When the User tries to guess
    Then the user will be given "<feedback>" on their guess

    Examples: | word  | guess | feedback
              | BAARD | BERGEN| INVALID, INVALID, INVALID, INVALID, INVALID, INVALID |
              | BAARD | BONJE | CORRECT, ABSENT, ABSENT, ABSENT, ABSENT |
              | BAARD | BARST | CORRECT, CORRECT, PRESENT, ABSENT, ABSENT |
              | BAARD | DRAAD | ABSENT, PRESENT, CORRECT, PRESENT, CORRECT |
              | BAARD | BAARD | CORRECT, CORRECT, CORRECT, CORRECT, CORRECT |



