Feature: todo_list_basic features
  As a student
  I want to add a task to the todo list
  or edit or delte a task
  So that I can better use the list as a reminder

Background: tasks in database

  Given the following tasks exist:
  | name         | priority | creation_date | due_date      |
  | Homework1    | 1        | 2022-11-10    | 2022-11-11    |
  | Physics      | 2        | 2022-11-20    | 2022-11-25    |

Scenario: add a new element
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW1"
  And  I press "Save Changes"
  Then I should see "HW1"

Scenario: edit the HW1
  Given I am on the edit page for "Homework1"
  And   I fill in "Name" with "HW2"
  When  I press "Update Task Info"
  Then  I should not see "HW1"
  And I should see "HW2"

Scenario: delete the HW1
  Given I am on the details page for "Physics"
  Then I should be on the details page for "Physics"
  Then  I press "delete"
  Then  I should not see "HW2"

