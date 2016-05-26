Feature: As a visitor
  So that I can sign up for the service
  I want to be able to see the registration form

Background:
  Given following users exists
    | name   | email            | password |
    | Jenny  | jenny@gmail.com  | password |
    | Daniel | daniel@gmail.com | password |

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
  And I fill in "Name" with ""
  And I fill in "Email" with "test@gmail.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I click on the "Create" button
  Then I should see "Name can't be blank"

Scenario: Display error message when a user leaves email empty
  Given I am on the "registration page"
  And I fill in "Name" with "Test"
  And I fill in "Email" with ""
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I click on the "Create" button
  Then I should see "Email can't be blank"

Scenario: Display error message when name is longer than 10 characters
  Given I am on the "registration page"
  And I fill in "Name" with "testtest123"
  And I fill in dummy user email and password
  And I click on the "Create" button
  Then I should see "Name is too long (maximum is 10 characters)"

Scenario: Display error message when email is duplicated
  Given I am on the "registration page"
  And I fill in "Name" with "Test"
  And I fill in "Email" with "jenny@gmail.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I click on the "Create" button
  Then I should see "Email has already been taken"

Scenario: Displays error message when name is duplicated
  Given I am on the "registration page"
  And I fill in "Name" with "Jenny"
  And I fill in dummy user email and password
  And I click on the "Create" button
  Then I should see "Name has already been taken"

Scenario: Displays error message when the password doesn't match
  Given I am on the "registration page"
  And I fill in "Name" with "Test"
  And I fill in "Email" with "test@gmail.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12312312"
  And I click on the "Create" button
  Then I should see "Password confirmation doesn't match Password"

Scenario: Display error message when password is empty
  Given I am on the "registration page"
  And I fill in "Name" with "Test"
  And I fill in "Email" with "test@gmail.com"
  And I fill in "Password" with ""
  And I fill in "Password confirmation" with ""
  And I click on the "Create" button
  Then I should see "Password can't be blank"

Scenario: Display error message when password is too short
  Given I am on the "registration page"
  And I fill in "Name" with "Test"
  And I fill in "Email" with "test@gmail.com"
  And I fill in "Password" with "123123"
  And I fill in "Password confirmation" with "123123"
  And I click on the "Create" button
  Then I should see "Password is too short (minimum is 8 characters)"

Scenario: Display error message when email is invalid
  Given I am on the "registration page"
  And I fill in "Name" with "Test"
  And I fill in "Email" with "testgmail.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I click on the "Create" button
  Then I should see "Email is invalid"

Scenario: Display welcome message when successfully signed up
  Given I am on the "registration page"
  And I fill in "Name" with "Test"
  And I fill in dummy user email and password
  And I click on the "Create" button
  Then I should see "Welcome! You have signed up successfully."

Scenario: Display error message when email or password is invalid
  Given I am on the "login page"
  And I fill in "Email" with "jenny2@gmail.com"
  And I fill in "Password" with "12345678"
  And I click on the "Log in" button
  Then I should see "Invalid email or password."

Scenario: Display welcome message when successfully signed in
  Given I am on the "login page"
  And I fill in "Email" with "jenny@gmail.com"
  And I fill in "Password" with "password"
  And I click on the "Log in" button
  Then I should be on the "home page"
  And I should see "Signed in successfully."
  And I should see "Logout"

Scenario: Display forgot password form after clicking Forgot password
  Given I am on the "login page"
  And I click on the "Forgot your password?" link
  Then I should be on the "forgotten password page"
  And I should see "Send me reset password instructions" button

Scenario: Display error message for wrong email on Forgot password page
  Given I am on the "forgot password page"
  And I fill in "user[email]" with "adffd@se.se"
  And I click on the "Send me reset password instructions" link
  Then I should be on the "failed password reset page"
  And I should see "Email not found"

Scenario: Display error message when email field is blank on Forgot password page
  Given I am on the "forgot password page"
  And I fill in "user[email]" with ""
  And I click on the "Send me reset password instructions" link
  Then I should be on the "failed password reset page"
  And I should see "Email can't be blank"

Scenario: Send email on Forgot password page
  Given I am on the "forgot password page"
  And I fill in "user[email]" with "jenny@gmail.com"
  And I click on the "Send me reset password instructions" link
  Then I should be on the "login page"
  And I should see "You will receive an email with instructions on how to reset your password in a few minutes."

Scenario: Display Inbox tab when signed in
  Given I am logged-in as "Jenny"
  And I am on the "home page"
  Then I should see "Inbox"

Scenario: Display form for composing email
  Given I am logged-in as "Jenny"
  And I am on the "Inbox" tab
  And I click on the "Compose" link
  Then I should be on the "compose page"
  And I should see "Recipients"
  And I should see "Subject"
  And I should see "Message"
  And I should see "Send Message" button

Scenario: Display user name when signed in
  Given I am logged-in as "Jenny"
  And I am on the "home page"
  Then I should see "Hello, Jenny"

Scenario: Composing email successfully
  Given I am logged-in as "Jenny"
  And I am on the "Inbox" tab
  And I click on the "Compose" link
  And I select "Jenny" from "conversation[recipients][]"
  And I fill in "conversation[subject]" with "test subject"
  And I fill in "conversation[body]" with "test body"
  And I click on the "Send Message" button
  Then I should see "Your message was successfully sent!"

Scenario: Display Sent tab when signed in
  Given I am logged-in as "Jenny"
  And I am on the "home page"
  And I click on the "Inbox" link
  Then I should see "Sent"

Scenario: Display Trash tab when signed in
  Given I am logged-in as "Jenny"
  And I am on the "home page"
  And I click on the "Inbox" link
  Then I should see "Trash"

Scenario: Display reply form when viewing an email
  Given I am logged-in as "Daniel"
  And I send a mail
  And I click on the "Logout" link
  Given I am logged-in as "Jenny"
  And I am on the "home page"
  And I click on the "Inbox" link
  And I click on the "View" link
  And I fill in "message[body]" with "Test Reply"
  And I click on the "Reply" button
  Then I should see "Your reply message was successfully sent!"

Scenario: Save and display login info the next time after remember me
  Given I am on the "login page"
  And I fill in "Email" with "jenny@gmail.com"
  And I fill in "Password" with "password"
  And I check "Remember me"
  And I click on the "Log in" button
  And I am on the "home page"
  And I click on the "Logout" link
  And I am on the "home page"
  And I click on the "Login" link
  Then I should be on the "login page"
  #ToDo: check how remember me works
  #And I should see "jenny@gmail.com" in "Email"
Scenario: Move to trash
  Given I am logged-in as "Daniel"
  And I send a mail
  And I click on the "Logout" link
  Given I am logged-in as "Jenny"
  And I am on the "home page"
  And I click on the "Inbox" link
  And I click on the "View" link
  And I click on the "Move to trash" link
  And I should not see "View"
