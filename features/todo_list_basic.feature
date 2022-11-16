Feature: todo_list_basic features
  As a student
  I want to add a task to the todo list
  or edit or delte a task
  So that I can better use the list as a reminder

Background: tasks and users in database, logged in as "test123@gmail.com"
  Given the following users exist:
  | email               | password    |
  | test123@gmail.com   | 123456      |

  Given the following tasks exist:
  | name         | priority   | creation_date | due_date      |
  | Homework1    | High       | 2022-11-10    | 2022-11-16    |
  | Physics      | Medium     | 2022-11-20    | 2022-11-20    |

  And I go to the log in page
  And  I fill in "Email" with "test123@gmail.com"
  And  I fill in "Password" with "123456"
  And  I press "Log in"
  Then I should see "Signed in successfully"

Scenario: add a new task
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW3"
  And  I press "Save Changes"
  Then I should see "HW3"

Scenario: add a new task but cancel
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW4"
  And  I follow "Cancel"
  Then I should not see "HW4"

Scenario: edit the HW1
  Given I am on the edit page for "Homework1"
  And   I fill in "Name" with "HW2"
  When  I press "Update Task Info"
  Then  I should not see "Homework1"
  And   I should see "HW2"

Scenario: task sort by due date
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW1"
  And  I select date "2022-November-25" from "Due On"
  And  I press "Save Changes"

  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW2"
  And  I select date "2022-November-19" from "Due On"
  And  I press "Save Changes"

  And I go to the home page
  Then I should see "HW2" before "HW1"

Scenario: delete the task Physics 
  Given I am on the details page for "Physics"
  And   I press "Delete"
  Then  I should see "'Physics' deleted"

Scenario: restrict to tasks with "High" priority 
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW5"
  And  I select "Hig" from "Priority"
  And  I press "Save Changes"

  When I check the following priority: High 
  And I uncheck the following priority: Medium, Low
  And I press "Refresh"
  Then I should see the following tasks: HW5 
