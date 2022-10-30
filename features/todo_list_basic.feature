Feature: todo_list_basic features



Scenario: add a new element
  When I go to the home page
  Then I follow "Add New Task"
  And  I fill in "Name" with "HW1"
  And  I press "Save Changes"
  Then I should see "HW1"

Scenario: edit the HW1
  Given I am on the details page for "Homework"
  When  I press "Edit"
  Then  I should be on the edit page for ""
  And   I fill in "name" with "HW2"
  Then  I should not see "HW1"

Scenario: delete the HW1
  Given I am on the details page for "HW2"
  When  I press "Delete"
  Then  I should not see "HW2"

