Feature: Save Bookmark
  
  In order to find a bookmark in the future,
  as a user of sociopub,
  i want to save it in sociopub.
  
  Scenario: Display insert url form in home page
    Given I am in top of home page
    Then I should see 'insert url form'
    
  Scenario: Save a link
    Given I can see in my page the 'insert url form'
    When I enter a url in url field
    And the url is valid
    Then It should be saved in database
  
  #missing description and tags suggestions
  
