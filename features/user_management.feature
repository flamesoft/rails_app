Feature: As a visitor
  So that I can sign up for the service
  I want to be able to see the registration form

Background: Given the database is empty

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
