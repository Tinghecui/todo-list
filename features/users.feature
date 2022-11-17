Feature: users features
  As a student
  I want to use todo list
  In order to do that
  I need to sign up and login

Background: users in database

  Given the following users exist:
  | email               | password    |
  | test123@gmail.com   | 123456      |

Scenario: Sign up successfully
  When I go to the sign up page
  And  I fill in "Email" with "test@gmail.com"
  And  I fill in "Password" with "123456"
  And  I fill in "Password confirmation" with "123456"
  And  I press "Sign up"
  Then I should see "You have signed up successfully"

Scenario: Sign up with duplicate email
  When I go to the sign up page
  And  I fill in "Email" with "test123@gmail.com"
  And  I fill in "Password" with "123456"
  And  I fill in "Password confirmation" with "123456"
  And  I press "Sign up"
  Then I should see "Email has already been taken"

Scenario: Sign up with short password
  When I go to the sign up page
  And  I fill in "Email" with "test@gmail.com"
  And  I fill in "Password" with "123"
  And  I fill in "Password confirmation" with "123"
  And  I press "Sign up"
  Then I should see "Password is too short"

Scenario: Log in
  When I go to the log in page
  And  I fill in "Email" with "test123@gmail.com"
  And  I fill in "Password" with "123456"
  And  I press "Log in"
  Then I should see "Signed in successfully"

Scenario: Log out
  When I go to the log in page
  And  I fill in "Email" with "test123@gmail.com"
  And  I fill in "Password" with "123456"
  And  I press "Log in"
  And  I follow "Log Out"
  Then I should see "Signed out successfully"

Scenario: Edit profile
  When I go to the sign up page
  And  I fill in "Email" with "test@gmail.com"
  And  I fill in "Password" with "123456"
  And  I fill in "Password confirmation" with "123456"
  And  I press "Sign up"

  When I go to the edit profile page
  And  I fill in "Email" with "test@gmail.com"
  And  I fill in "Password" with "1234567"
  And  I fill in "Password confirmation" with "1234567"
  And  I fill in "Current password" with "123456"
  And  I press "Update"
  Then I should see "Your account has been updated successfully"

Scenario: Cancel account
  When I go to the sign up page
  And  I fill in "Email" with "test@gmail.com"
  And  I fill in "Password" with "123456"
  And  I fill in "Password confirmation" with "123456"
  And  I press "Sign up"

  When I go to the edit profile page
  And  I press "Cancel my account"
  Then I should see "Your account has been successfully cancelled"