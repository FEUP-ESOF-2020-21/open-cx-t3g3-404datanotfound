Feature: New Event
  User should be able to enter in a new event by inserting a valid code.

Scenario: Enter in a new event
     Given I have "JoinAnEvent"
     Then I tap the "neweventcode" button
     Then I should see the "EnterEventCode" screen
     When I fill the "eventcodefield" field with "WS2020Attendee"
     Then I tap the "entereventcode" button
     Then I should see the "HomeFeed" screen