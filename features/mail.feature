Scenario: Display Inbox tab when signed in
  Given I am logged-in as "Jenny"
  And I am on the "home page"
  Then I should see "Inbox"

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

Scenario: Display form for composing email
  Given I am logged-in as "Jenny"
  And I am on the "Inbox" tab
  And I click on the "Compose" link
  Then I should be on the "compose page"
  And I should see "Recipients"
  And I should see "Subject"
  And I should see "Message"
  And I should see "Send Message" button

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

Scenario: Composing email successfully
  Given I am logged-in as "Jenny"
  And I am on the "Inbox" tab
  And I click on the "Compose" link
  And I select "Jenny" from "conversation[recipients][]"
  And I fill in "conversation[subject]" with "test subject"
  And I fill in "conversation[body]" with "test body"
  And I click on the "Send Message" button
  Then I should see "Your message was successfully sent!"

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

Scenario: Validate subject is not empty
  Given I am logged-in as "Daniel"
  And I am on the "Inbox" tab
  And I click on the "Compose" link
  And I select "Jenny" from "conversation[recipients][]"
  And I fill in "conversation[subject]" with ""
  And I fill in "conversation[body]" with "test body"
  And I click on the "Send Message" button
  Then I should see "Your message must have a subject"

Scenario: Validate subject is not empty
  Given I am logged-in as "Daniel"
  And I am on the "Inbox" tab
  And I click on the "Compose" link
  And I select "Jenny" from "conversation[recipients][]"
  And I fill in "conversation[subject]" with "subject"
  And I fill in "conversation[body]" with ""
  And I click on the "Send Message" button
  Then I should see "Your message cannot be empty"

Scenario: Validate recipients are not empty
  Given I am logged-in as "Daniel"
  And I am on the "Inbox" tab
  And I click on the "Compose" link
  And I fill in "conversation[subject]" with "subject"
  And I fill in "conversation[body]" with "boy"
  And I click on the "Send Message" button
  Then I should see "Your recipients cannot be empty"

Scenario: Validates that the reply form is not empty
  Given I am logged-in as "Daniel"
  And I send a mail
  And I click on the "Logout" link
  Given I am logged-in as "Jenny"
  And I am on the "home page"
  And I click on the "Inbox" link
  And I click on the "View" link
  And I click on the "Reply" button
  Then I should see "Your message cannot be empty"
