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
  | name          | priority   | due_date     | task_size    |
  | Homework1     | High       | 2023-2-6     | In Process   |
  | Physics       | Medium     | 2023-2-20    | In Process   |

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
  Then I should see "HW3 was successfully created"

Scenario: add a new task but fail because of due date in the past
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "test"
  And  I select date "2022-November-10" from "Due On"
  And  I press "Save Changes"
  Then I should see "Due date should not be invalid or in the past"

Scenario: add a new task but fail because of invalid due date
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "test"
  And  I select date "2022-February-31" from "Due On"
  And  I press "Save Changes"
  Then I should see "Due date should not be invalid or in the past"

Scenario: add a new task but cancel
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW4"
  And  I follow "Cancel"
  Then I should not see "HW4"

Scenario: edit the HW1 but fail because of invalid due date
  Given I am on the edit page for "Homework1"
  And   I fill in "Name" with "HW2"
  And   I select date "2022-November-2" from "Due On"
  When  I press "Update Task Info"
  Then I should see "Due date should not be invalid or in the past"

Scenario: edit the HW1
  Given I am on the edit page for "Homework1"
  And   I fill in "Name" with "HW2"
  When  I press "Update Task Info"
  Then  I should not see "Homework1"
  And   I should see "HW2"

Scenario: delete the task Physics 
  Given I am on the details page for "Physics"
  And   I press "Delete"
  Then  I should see "'Physics' deleted"

Scenario: task sort by due date
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW1"
  And  I select date "2023-February-2" from "Due On"
  And  I press "Save Changes"

  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW2"
  And  I select date "2023-January-23" from "Due On"
  And  I press "Save Changes"

  And I go to the home page
  Then I should see "HW2" before "HW1"

Scenario: filter tasks with "High" priority 
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW5"
  And  I select "High" from "Priority"
  And  I press "Save Changes"
  
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW6"
  And  I select "Medium" from "Priority"
  And  I press "Save Changes"

  When I check the following priority: High 
  And  I uncheck the following priority: Medium, Low
  And  I press "Refresh"
  Then I should see the following tasks: HW5 
  And  I should not see the following tasks: HW6 

Scenario: filter tasks with "In Process" status 
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW7"
  And  I select "In Process" from "Status"
  And  I press "Save Changes"
  
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW8"
  And  I select "Complete" from "Status"
  And  I press "Save Changes"

  When I select "In Process" from "Status"
  And  I press "Refresh"
  Then I should see the following tasks: HW7
  And  I should not see the following tasks: HW8 

Scenario: filter tasks with Time Frame
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW9"
  And  I select date "2023-January-18" from "Due On"
  And  I press "Save Changes"
  
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW10"
  And  I select date "2023-March-20" from "Due On"
  And  I press "Save Changes"

  When I select "1m" from "Time Frame"
  And  I press "Refresh"
  Then I should see the following tasks: HW9
  And  I should not see the following tasks: HW10 

Scenario: nav bar
  Given I am on the edit page for "Homework1"
  And I follow "Tasks"
  Then  I should see "All Reminders"