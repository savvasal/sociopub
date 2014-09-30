
Feature: Static Pages

  Scenario: Display SocioPub
    Given a user visits the 'Home Page'
    Then they should see the content 'SocioPub'
    And they should see the base title
    And they should not see a custom page title
    

  Scenario: Display Help
    Given a user visits the 'Help Page'
    Then they should see the content 'Help'
