Feature: SkyTV Login
  Scenario: Verify successful user login
    Given User has navigated to "Home Page"
    When User inputs "MyUsername" in "username" field
    And User inputs "MyPassword" in "password" field
    Then "Login Page" is displayed