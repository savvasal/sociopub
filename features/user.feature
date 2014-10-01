Feature: User

  Scenario: Test for name and email attributes
    Given a new user created
    Then user should response to name
    And user should response to email
    And user should be valid

  Scenario: Name not present
    Given a name is not present
    Then it should not be valid

  Scenario: Too long names
    Given a name is too long
    Then it should not be valid

  Scenario Outline: Ivalid email format
    Given a user with name <name> and email like that <email>
    Then it should not be valid
    Examples:
    | name | email             |
    | fooa | user@foo,com      |
    | foob | user_at_foo.org   |
    | fooc | example.user@foo. |
    | food | foo@bar_baz.com   |
    | fooe | foo@bar+baz.com   |
