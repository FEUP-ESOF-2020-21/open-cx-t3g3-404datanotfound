Feature: Post
  User should be able to make a new post from the HomeFeed of some event.

Scenario: Make a post
     Given I have "HomeFeed"
     Then I tap the "addpost" button
     Then I should see the "NewPost" screen
     When I fill the "textfield" field with "This is a test post"
     Then I tap the "Post" button
     Then I should see the "HomeFeed" screen
