Feature: Static Pages
  
  Scenario: Link to Home Page
    When I visit application
    Then I should see link to "home" Page

  Scenario: Link to Help Page
    When I visit application
    Then I should see link to "help" Page

  Scenario: Link to About Page
    When I visit application
    Then I should see link to "about" Page
    
  Scenario: Home Page Works
    When I visit application
    And I request to get "home" Page
    Then I should see "home" Page

  Scenario: Help Page Works
    When I visit application
    And I request to get "help" Page
    Then I should see "help" Page

  Scenario: About Page Works
    When I visit application
    And I request to get "about" Page
    Then I should see "about" Page
