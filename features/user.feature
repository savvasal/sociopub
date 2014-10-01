Feature: User

  Scenario: Test for name and email attributes
    Given a new user created
    Then user should response to name
    And user should response to email
    And user should response to password digest
    And user should response to password
    And user should response to password confirmation
    And user should response to authenticate
    And user should be valid

  Scenario: Name not present
    Given a name is not present
    Then user should not be valid

  Scenario: Too long names
    Given a name is too long
    Then user should not be valid

  Scenario Outline: Ivalid email format
    Given a user with name <name> and email like that <email>
    Then user should not be valid
    Examples:
    | name | email             |
    | fooa | user@foo,com      |
    | foob | user_at_foo.org   |
    | fooc | example.user@foo. |
    | food | foo@bar_baz.com   |
    | fooe | foo@bar+baz.com   |
 
  Scenario: Duplicate email
    Given an email address is already taken
    Then user should not be valid

  Scenario: Password is not present
    Given password is not present
    Then user should not be valid

  Scenario: Confirm password doesn't match
    Given password doesnt match confirmation
    Then user should not be valid

  Scenario: Short password
    Given a password is too short
    Then user should not be valid

  Scenario: Inalid password
    Given a user exist
    And enter an invalid password
    Then password should not be valid
