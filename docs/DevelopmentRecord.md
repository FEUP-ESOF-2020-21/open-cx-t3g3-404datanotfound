# openCX-*ConferenceBook* Development Report

Welcome to the documentation pages of the *ConferenceBook* of **openCX**!

You can find here detailed about the *ConferenceBook*, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report <!---(see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)) -->, organized by discipline (as of RUP): 

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!

- Abel Augusto Dias Tiago
- Guilherme Lucas Peralta
- João Carlos Machado Rocha Pires
- João Carlos Ramos Gonçalves de Matos
- Maria Jorge Miranda Loureiro

---

## Product Vision
<!---Start by defining a clear and concise vision for your module, to help members of the team, contributors, and users into focusing their often disparate views into a concise, visual, and short textual form. It provides a "high concept" of the product for marketers, developers, and managers.

**We favor a catchy and concise statement, ideally one sentence.**)--->

<!---
To learn more about how to write a good product vision, please see also:
* [How To Create A Convincing Product Vision To Guide Your Team, by uxstudioteam.com](https://uxstudioteam.com/ux-blog/product-vision/)
* [Product Management: Product Vision, by ProductPlan](https://www.productplan.com/glossary/product-vision/)
* [Vision, by scrumbook.org](http://scrumbook.org/value-stream/vision.html)
* [How to write a vision, by dummies.com](https://www.dummies.com/business/marketing/branding/how-to-write-vision-and-mission-statements-for-your-brand/)
* [20 Inspiring Vision Statement Examples (2019 Updated), by lifehack.org](https://www.lifehack.org/articles/work/20-sample-vision-statement-for-the-new-startup.html)
--->
---

There is always a time in physical or virtual conferences when you wish you could share a thought, experience, or chat with another participant. ConferenceBook is a social network to enhance this communication. Connecting people, towards mind broadening and empowerment of relationships.

## Elevator Pitch
<!---Draft a small text to help you quickly introduce and describe your product in a short time and a few words (~800 characters), a technique usually known as elevator pitch.

Take a look at the following links to learn some techniques:
* [Crafting an Elevator Pitch](https://www.mindtools.com/pages/article/elevator-pitch.htm)
* [The Best Elevator Pitch Examples, Templates, and Tactics - A Guide to Writing an Unforgettable Elevator Speech, by strategypeak.com](https://strategypeak.com/elevator-pitch-examples/)
* [Top 7 Killer Elevator Pitch Examples, by toggl.com](https://blog.toggl.com/elevator-pitch-examples/)
--->
---

Most conferences fail when it comes to communication amongst participants. That's the reason why we created ConferenceBook: an app to make this communication easier than ever, providing participants with a full networking experience. ConferenceBook allows attendees, organizers and sponsors to interact with each others, by making posts, sharing contacts and interests, and chatting. With ConferenceBook, your event will become more appealing to your participants!

## Requirements

<!---In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

Start by contextualizing your module, describing the main concepts, terms, roles, scope and boundaries of the application domain addressed by the project.
--->

### Use case diagram 

![Use Case Diagram](use_case_diagram.png)

#### Login:

* __Actor__: User
* __Description__: This use case exists so that a user can login into ConferenceBook.
* __Preconditions and Postconditions__: In order to sucessfully login, the user must have created an account and use a valid email/password pair. In the end, the user will be able to acess the event's feed.
* __Normal Flow__:
  i) User types email/password
  ii) System validates email/password pair
  iii) System will show the event's feed
* __Alternative Flows and Exceptions__:
  i) User types email/password
  ii) System validates email/password pair and emmits error message
  * __OR__
  i) User types email/password
  ii) System validates email/password pair
  iii) If it is the first time the user accesses ConferenceBook, the system will redirect user to a page where the user should insert the event's code

#### Show conference participants:

* __Actor__: User
* __Description__: This use case exists so that a user can see every other user on the event and, if he wishes, display another user's profile.
* __Preconditions and Postconditions__: In order to access the user's list, the user must be logged in and have access to the event in question. In the end, a user's list will be displayed.
* __Normal Flow__:
  i) User's list is displayed 
* __Alternative Flows and Exceptions__:
  i) User's list is displayed 
  ii) User clicks another user's profile
  iii) The clicked profile is displayed

#### Edit "My Profile"
* __Actor__: User
* __Description__: This use case exists so that a user can add or update information in his profile.
* __Preconditions and Postconditions__: In order to edit his profile, the user must be logged in and add new information in his profile. In the end, the user's profile will be updated.
* __Normal Flow__:
  i) User's current profile is displayed
  ii) User adds/updates information on his profile
  iii) User validates the changes
  iv) System saves the new information
* __Alternative Flows and Exceptions__:
  i) User's current profile is displayed
  ii) User adds/updates information on his profile
  iii) User doesn't validate the changes
  iv) System keeps the old information

#### See ConferenceBook feed
* __Actor__: User
* __Description__: This use case exists so that a user can see, by inverse order of posting, all the posts in the ConferenceBook feed, using the infinite scroll technique.
* __Preconditions and Postconditions__: In order to see the feed, the user must be logged in, have access to the event in question and scroll through out the posts. In the end, the user will have catched up on as many posts as he wishes.
* __Normal Flow__:
  i) System shows event's feed
  ii) User scrolls down to see past publications
  iii) The system will keep showing older publications as long as the user keeps scrolling and there are more publications to be shown
* __Alternative Flows and Exceptions__:
  i) System shows event's feed
  ii) User scrolls up to refresh to newer publications
  iii) The system will show the new posts which have been made between the moment the user got to the feed page and the moment he refreshed the feed

#### Chat with other users
* __Actor__: User
* __Description__: This use case exists so that a user can respond a conversation initiated by a Participant. This means that a Sponsor cannot be the one initiating a conversation, but he can keep it going.
* __Preconditions and Postconditions__: In order to chat with other users, the user must be logged in, have access to the event in question and respond to the other user's message. In the end, a dialogue between two users will have been made and the conversation record will stay on the chat.
* __Normal Flow__:
  i) System pops a message through chat
  ii) User reads and responds the message
  iii) User hits 'Send'
  iv) System sends the message
* __Alternative Flows and Exceptions__:
  i) System pops a message through chat
  ii) User reads and responds the message
  iii) User doesn't hit 'Send'
  iv) System doesn't send the message
  * __OR__
  i) System pops a message through chat
  ii) User reads the message

#### Like posts
* __Actor__: User
* __Description__: This use case exists so that a user can like a post made by another user.
* __Preconditions and Postconditions__: In order to like posts, the user must be logged in and have access to the event in question. In the end, a like from the user will appear on the post
* __Normal Flow__:
  i) User clicks like button
  ii) System adds like to the publication
* __Alternative Flows and Exceptions__:
  i) User unclicks like button
  ii) System removes like from the publication


#### Post/comment (limited)
* __Actor__: Sponsor
* __Description__: This use case exists so that a sponsor can post/comment on the ConferenceBook feed while, at the same time, preventing him from overloading the feed with publicity. As is, the sponsor will have a limited amount of posts/comments he can make (unless the sponsor is responding to comments on his own post)
* __Preconditions and Postconditions__: In order to post/comment posts on an event, the sponsor must be logged in and have his sponsorship validated. In the end, posts and comments made by the sponsor will appear on the feed.
* __Normal Flow__:
  i) System shows a place to post/comment
  ii) Sponsor posts/comments something
  iii) Sponsor hits 'post'/'comment'
  iv) System posts/comments a publication
* __Alternative Flows and Exceptions__:
  i) System shows a place to post/comment
  ii) Sponsor posts/comments something
  iii) Sponsor doesn't hits 'post'/'comment'
  iv) System doesn't posts/comments a publication
  * __OR__
  i) System shows a place to post/comment
  ii) Sponsor posts/comments/ something
  iii) Sponsor hits 'post'/'comment', but the maximum of posts/comments has been achieved
  iv) System displays error message

#### Post/comment
* __Actor__: Participant
* __Description__: This use case exists so that a participant can post/comment photographs, videos and/or text on the ConferenceBook feed
* __Preconditions and Postconditions__: In order to post and comment posts on an event, the participant must be logged in and have access to the event in question. In the end, posts and comments made by the participant will appear on the feed.
* __Normal Flow__:
  i) System shows a place to post/comment
  ii) Participant posts/comments something
  iii) Participant hits 'post'/'comment'
  iv) System posts/comments a publication
* __Alternative Flows and Exceptions__:
  i) System shows a place to post/comment
  ii) Participant posts/comments something
  iii) Participant doesn't hits 'post'/'comment'
  iv) System doesn't posts/comments a publication

#### Initiate a private conversation
* __Actor__: Participant
* __Description__: This use case exists so that a participant can initiate a private conversation with another user on the ConferenceBook's chat.
* __Preconditions and Postconditions__: In order to initiate a private conversation, the participant must be logged in and have access to the event in question. In the end, the participant will have started a conversation with another user
* __Normal Flow__:
  i) Participant opens chat with another user
  ii) Participant types a message
  iii) Participant hits 'send'
  iv) System sends the message
* __Alternative Flows and Exceptions__:
  i) Participant opens chat with another user
  ii) Participant types a message
  iii) Participant doesn't hit 'send'
  iv) System doesn't send the message


#### Moderate posts
* __Actor__: Organizer
* __Description__: This use case exists so that an organizer can moderate the posts (delete or manage spam posts) on the ConferenceBook feed.
* __Preconditions and Postconditions__: In order to moderate the post, the organizer must be logged in. In the end, there won't be hatred nor spam posts on the ConferenceBook feed.
* __Normal Flow__:
  i) Moderator finds a hatred post
  ii) Moderador clicks delete button
  iii) System deletes the post
  iv) System notifies user of the deletion of his post
* __Alternative Flows and Exceptions__:
  i) Moderator finds a spam post
  ii) Moderador warns sponsor


<!---Create a use-case diagram in UML with all high-level use cases possibly addressed by your module.

Give each use case a concise, results-oriented name. Use cases should reflect the tasks the user needs to be able to accomplish using the system. Include an action verb and a noun. 

Briefly describe each use case mentioning the following:

* **Actor**. Name only the actor that will be initiating this use case, i.e. a person or other entity external to the software system being specified who interacts with the system and performs use cases to accomplish tasks. 
* **Description**. Provide a brief description of the reason for and outcome of this use case, or a high-level description of the sequence of actions and the outcome of executing the use case. 
* **Preconditions and Postconditions**. Include any activities that must take place, or any conditions that must be true, before the use case can be started (preconditions) and postconditions. Describe also the state of the system at the conclusion of the use case execution (postconditions). 

* **Normal Flow**. Provide a detailed description of the user actions and system responses that will take place during execution of the use case under normal, expected conditions. This dialog sequence will ultimately lead to accomplishing the goal stated in the use case name and description. This is best done as a numbered list of actions performed by the actor, alternating with responses provided by the system. 
* **Alternative Flows and Exceptions**. Document other, legitimate usage scenarios that can take place within this use case, stating any differences in the sequence of steps that take place. In addition, describe any anticipated error conditions that could occur during execution of the use case, and define how the system is to respond to those conditions. 
--->

### User stories

 In the following sections, all user stories are separated by roles, the effort for each of them is defined and they are ordered by importance, according to the MoSCoW method.

<!--
**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in Gherkin), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.
-->

#### Users

General role, includes every user of the conference, be it attendee, speaker, organizer or sponsor.

#### Participants (including attendees, speakers and organizers)

This role includes attendees, speakers and organizers of the conference, since they will have the same funcionalities while using the app. In addition, organizers will have an extent of this role, since they will have additional funciontalities, explained bellow.

#### Organizers

This roll will be assigned to the organizers of each conference. Naturally, they will play an important role in moderating the feed and helping participants with anything they need.

#### Sponsors

This roll will belong to representatives of organizations or institutions that will be present at the event. In this sense, they will have different objectives from the attendees and, therefore, different actions.

#### User Story Map

![User Story Map](US_Map.jpg)

### User Stories MockUps
<div>
<img src="MockupImages/AppOpening.png" width=25% height=25%>
<img src="MockupImages/Login.png" width=25% height=25%>
<img src="MockupImages/JoinAnEvent.png" width=25% height=25%>
</div>

<div>
<img src="MockupImages/CreateProfile1.png" width=25% height=25%>
<img src="MockupImages/CreateProfile2.png" width=25% height=25%>
<img src="MockupImages/MyProfile1.png" width=25% height=25%>
</div>

<div>
<img src="MockupImages/MyProfile2.png" width=25% height=25%>
<img src="MockupImages/EnterEventCode.png" width=25% height=25%>
<img src="MockupImages/WelcomeOnBoard.png" width=25% height=25%>
</div>

<div>
<img src="MockupImages/HomeFeed.png" width=25% height=25%>
<img src="MockupImages/NewPost.png" width=25% height=25%>
<img src="MockupImages/Comments.png" width=25% height=25%>
</div>

<div>
<img src="MockupImages/MyMessages.png" width=25% height=25%>
<img src="MockupImages/Chat.png" width=25% height=25%>
<img src="MockupImages/OtherEventsOrAddOne.png" width=25% height=25%>
</div>

<div>
<img src="MockupImages/NotificationsPanel.png" width=25% height=25%>
<img src="MockupImages/SeeAllParticipants.png" width=25% height=25%>
<img src="MockupImages/Search.png" width=25% height=25%>
</div>

### Domain model

<!--To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module.-->

---

## Architecture and Design
<!--The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them. 

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.-->

### Logical architecture
<!--The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

It can be beneficial to present the system both in a horizontal or vertical decomposition:
* horizontal decomposition may define layers and implementation concepts, such as the user interface, business logic and concepts; 
* vertical decomposition can define a hierarchy of subsystems that cover all layers of implementation.-->

### Physical architecture

Our project's physical structure is very simple. The user installs ConferenceBook on their smartphone, and whenever the need to connect with our database arises, it communicates with it via HTTPS requests, where it will store and retrieve all the information needed.

Our project was fully developed using Flutter - an emerging framework for mobile development that supports both iOS and Android - combined with Firebase to store participants data. We used Firebase for our database server because of its easy integration with flutter, as well as simple setup.

#### Deployment Diagram

![Deployment Diagram](DeploymentDiagram.png)

<!--The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams or component diagrams (separate or integrated), showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for openCX are, for example, frameworks for mobile applications (Flutter vs ReactNative vs ...), languages to program with microbit, and communication with things (beacons, sensors, etc.).-->

### Prototype
<!--To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe in more detail which, and how, user(s) story(ies) were implemented.-->

---

## Implementation
<!--Regular product increments are a good practice of product management. 

While not necessary, sometimes it might be useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. Since the code should speak by itself, try to keep this section as short and simple as possible.

Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.-->

---
## Test

<!--There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.

In this section it is only expected to include the following:
* test plan describing the list of features to be tested and the testing methods and tools;
* test case specifications to verify the functionalities, using unit tests and acceptance tests.
 
A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.-->

---
## Configuration and change management

<!--Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow](https://guides.github.com/introduction/flow/).-->


---

## Project management

<!--Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled.

In the context of ESOF, we expect that each team adopts a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track their projects.

Example of tools to do this are:
  * [Trello.com](https://trello.com)
  * [Github Projects](https://github.com/features/project-management/com)
  * [Pivotal Tracker](https://www.pivotaltracker.com)
  * [Jira](https://www.atlassian.com/software/jira)

We recommend to use the simplest tool that can possibly work for the team.-->
