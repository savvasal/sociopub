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

  Scenario: Link to Contact Page
    When I visit application
    Then I should see link to "Sign up" Page
    
  Scenario: Home Page Works
    When I visit application
    And I click the link to "Home"
    Then I should see "Home" Page
    And I should see "Sociopub, Your Personal Newsboy is delivering Everything for You " on title

  Scenario: Help Page Works
    When I visit application
    And I click the link to "Help"
    Then I should see "Help" Page
    And I should see "Help | Sociopub, Your Personal Newsboy is delivering Everything for You" on title


  Scenario: About Page Works
    When I visit application
    And I click the link to "About"
    Then I should see "About" Page
    And I should see "About | Sociopub, Your Personal Newsboy is delivering Everything for You" on title

  Scenario: Contact Page Works
    When I visit application
    And I click the link to "Contact"
    Then I should see "Contact" Page
    And I should see "Contact | Sociopub, Your Personal Newsboy is delivering Everything for You" on title

  Scenario: Sign Up Works
    When I visit application
    And I click the link to "Sign up now!"
    Then I should see "Sign Up" Page
    And I should see "Sign Up | Sociopub, Your Personal Newsboy is delivering Everything for You" on title

