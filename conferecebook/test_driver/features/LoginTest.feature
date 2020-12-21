Feature: Login
    User should be able to login using an email and password.

Scenario: User do a successful login with an email and password
     Given I'm in the "Login" screen
     When I fill the "emailfield" field with "teste@gherkin.com"
     And I fill the "passwordfield" field with "123456"
     And I tap the "loginbutton" button
     Then I see the "JoinAnEvent" screen