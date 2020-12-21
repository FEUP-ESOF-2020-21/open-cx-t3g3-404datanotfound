Feature: New Event
  User should be able to enter in a new event by inserting a valid code.

Scenario: Enter in a new event
     Given I'm the user test@gherkin.com, I'm logged in and I see the "JoinAnEvent" screen
     When I tap the "neweventcode" button
     Then I see the "EnterEventCode" screen
     When I fill the "eventcodefield" field with "WS2020Attendee"
     And I tap the "entereventcode" button
     Then I see the "HomeFeed" screen