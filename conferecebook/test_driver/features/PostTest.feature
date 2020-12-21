Feature: Post
  User should be able to make a new post from the HomeFeed of some event.

Scenario: Make a post
     Given I'm the user test@gherkin.com, I'm logged in, I'm as a participant at WebSummit2020 and I see the "HomeFeed" screen
     When I tap the "addpost" button
     Then I see the "NewPost" screen
     When I fill the "textfield" field with "This is a test post"
     And I tap the "Post" button
     Then I see the "HomeFeed" screen