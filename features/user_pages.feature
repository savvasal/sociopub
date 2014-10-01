Feature: User Pages

  Scenario: Invalid information
    Given a user visit signup page
    And insert invalid information
    Then it should not create a user  

  Scenario: Valid information
    Given a user visit signup page
    And insert valid information
    Then it should create a user
