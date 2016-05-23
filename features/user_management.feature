Feature: As a visitor
  So that I can sign up for the service
  I want to be able to see the registration form

Background: Given the database is empty

Scenario: Allows a visitor to access a registration page
  Given I am on the "home page"
  And I click on the "Sign up" link
  Then I should be on the "registration page"
