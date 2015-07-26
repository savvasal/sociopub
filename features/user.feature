Feature: Users
  
  Scenario: Link for Sign Up
    Given I visit application
    Then I should see link to "Sign up" Page
    
  Scenario: Sign Up Works
    Given I visit application
    When I click the link to "Sign up now!"
    Then I should see "Sign Up" Page
    And I should see "Sign Up | Sociopub, Your Personal Newsboy is delivering Everything for You" on title

  Scenario Outline: A user sign up with a valid email
    Given a <user> is trying to sign up with an invalid <email>
    Then the <user> should not be valid

    Examples:
    | user | email             |
    | fooa | user@foo,com      |
    | foob | user_at_foo.org   |
    | fooc | example.user@foo. |
    | food | foo@bar_baz.com   |
    | fooe | foo@bar+baz.com   |
    

    
  Scenario: Login fields
    When I visit application
    Then I should see link for "Login"
