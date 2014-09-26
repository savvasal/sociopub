Feature: Add Link

  Scenario: Submit Link 
    Given a user visits the profile page
    Then they should see submit link

   Scenario: Add Invalid Link
    Given a user visits the profile page
    When they submit invalid link
    Then they should see an error message

  Scenario: Add Valid Link 
    Given a user visits the profile page
    When the user submits valid link
    Then they should see suggested tags
    And they should see a small description

