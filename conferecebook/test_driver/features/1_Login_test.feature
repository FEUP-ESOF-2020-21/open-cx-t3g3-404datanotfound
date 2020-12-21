Feature: Login
    User should be able to login using an email and password.

Scenario: User do a successful login with an email and password
     Given I have "emailfield" and "passwordfield" and "loginbutton"
     When I fill the "emailfield" field with "teste@gherkin.com"
     And I fill the "passwordfield" field with "123456"
     Then I tap the "loginbutton" button
     Then I should see the "JoinAnEvent" screen