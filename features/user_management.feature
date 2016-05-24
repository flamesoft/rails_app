Feature: As a visitor
  So that I can sign up for the service
  I want to be able to see the registration form

Background:
  Given there is an existing user called Jenny


Scenario: Allows a visitor to access a registration page
  Given I am on the "home page"
  And I click on the "Sign up" link
  Then I should be on the "registration page"

Scenario: Allows a visitor to access a login page
  Given I am on the "home page"
  And I click on the "Login" link
  Then I should be on the "login page"

Scenario: Display error message when a user put in invalid information
  Given I am on the "registration page"
  And I fill in "user_name" with ""
  And I fill in "user_email" with "test@gmail.com"
  And I fill in "user_password" with "12345678"
  And I fill in "user_password_confirmation" with "12345678"
  And I click on the "Create" button
  Then I should see "Name can't be blank"

Scenario: Display error message when name is longer than 10 characters
  Given I am on the "registration page"
  And I fill in "user_name" with "testtest123"
  And I fill in dummy user email and password
  And I click on the "Create" button
  Then I should see "Name is too long (maximum is 10 characters)"

Scenario: Display error message when email is duplicated
  Given I am on the "registration page"
  And I fill in "user_name" with "test123"
  And I fill in "user_email" with "jenny@gmail.com"
  And I fill in "user_password" with "12345678"
  And I fill in "user_password_confirmation" with "12345678"
  And I click on the "Create" button
  Then I should see "Email has already been taken"

Scenario: Displays error message when name is duplicated
  Given I am on the "registration page"
  And I fill in "user_name" with "Jenny"
  And I fill in dummy user email and password
  And I click on the "Create" button
  Then I should see "Name has already been taken"
