Feature: todo_list_basic features


Background: movies in database
 
  Given the following movies exist:
  | name         | Creation Date | Due date   |
  | Homework     | 1992-11-25    | 1993-11-25 |
  | Physics      | 1992-11-25    | 1993-11-25 |

Scenario: add a new element
  When I go to the home page
  Then I should be on the create page
  And  I fill in "name" with "HW1"
  And  I press "Save Changes"
  Then I should see the "HW1"

Scenario: edit the HW1
  Given I am on the details page for "HW1"
  When  I press "Edit"
  Then  I should be on the edit page for ""
  And   I fill in "name" with "HW2"
  Then  I should not see "HW1"

Scenario: delete the HW1
  Given I am on the details page for "HW2"
  When  I press "Delete"
  Then  I should not see "HW2"

