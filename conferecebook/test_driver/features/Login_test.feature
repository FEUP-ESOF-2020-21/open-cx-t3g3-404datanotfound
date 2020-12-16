Feature: Login, New Event and Post
  User should be able to login using an email and password. Then, should be able to enter in a new
  event by inserting a code. Finally, should be able to access the HomeFeed of that event and make
  a new post.

Scenario: User do a successful login with an email and password, enter in a new event and make a post
     Given I have "emailfield" and "passwordfield" and "loginbutton"
     When I fill the "emailfield" field with "teste@gherkin.com"
     And I fill the "passwordfield" field with "123456"
     Then I tap the "loginbutton" button
     Then I should see the "JoinAnEvent" screen
     Then I pause for 3 seconds
     Then I tap the "neweventcode" button
     Then I should see the "EnterEventCode" screen
     Given I have "eventcodefield"
     When I fill the "eventcodefield" field with "WS2020Attendee"
     Then I tap the "entereventcode" button
     Then I should see the "HomeFeed" screen
     Then I pause for 3 seconds
     Then I tap the "addpost" button
     Then I should see the "NewPost" screen
     Given I have "textfield"
     When I fill the "textfield" field with "This is a test post"
     Then I tap the "Post" button
     Then I should see the "HomeFeed" screen
