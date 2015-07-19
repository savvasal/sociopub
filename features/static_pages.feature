Feature: Static Pages
  
  Scenario: Link to Home Page
    When I visit application
    Then I should see link to "Home" Page

  Scenario: Link to Help Page
    When I visit application
    Then I should see link to "Help" Page

  Scenario: Link to About Page
    When I visit application
    Then I should see link to "About" Page
    
  Scenario: Link to Contact Page
    When I visit application
    Then I should see link to "Contact" Page
    
  Scenario: Home Page Works
    When I visit application
    And I request to get "Home" Page
    Then I should see "Home" Page
    And I should see "Sociopub, Your Personal Newsboy is delivering Everything for You " on title

  Scenario: Help Page Works
    When I visit application
    And I request to get "Help" Page
    Then I should see "Help" Page
    And I should see "Help | Sociopub, Your Personal Newsboy is delivering Everything for You" on title


  Scenario: About Page Works
    When I visit application
    And I request to get "About" Page
    Then I should see "About" Page
    And I should see "About | Sociopub, Your Personal Newsboy is delivering Everything for You" on title

  Scenario: Contact Page Works
    When I visit application
    And I request to get "Contact" Page
    Then I should see "Contact" Page
    And I should see "Contact | Sociopub, Your Personal Newsboy is delivering Everything for You" on title

