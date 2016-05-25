Given(/^following users exists$/) do |table|
  FactoryGirl.find_definitions
  table.hashes.each do |user|
    create(:user, name: user[:name], email: user[:email], password: user[:password])
  end
end

Given(/^I am on the "([^"]*)"$/) do |page|
  case page
   when 'home page' then
     visit root_path
   when 'registration page' then
     visit new_user_registration_path
   when 'login page' then
     visit user_session_path
   when 'forgot password page'
     visit new_user_password_path
   when 'failed password reset page'
     visit user_password_path
  end
end

Given(/^I am on the "([^"]*)" tab$/) do |tab|
  case tab
   when 'Inbox' then
     visit mailbox_inbox_path
  end
end

Given(/^I click on the "([^"]*)" link$/) do |link|
  click_link_or_button link
end

Then(/^show me the page$/) do
  save_and_open_page
end

Then(/^I should be on the "([^"]*)"$/) do |page|
  case page
   when 'home page' then
     expect(current_path).to eq root_path
   when 'registration page' then
     expect(current_path).to eq new_user_registration_path
   when 'login page' then
     expect(current_path).to eq user_session_path
   when 'compose page' then
     #ToDo: how to write conversation_path/:id

  end
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

Given(/^I click on the "([^"]*)" button$/) do |button|
  click_link_or_button button
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_text(text)
end

Given(/^I fill in dummy user email and password$/) do
  steps %Q{
    And I fill in "Email" with "test@gmail.com"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
  }
end

Given(/^I am logged\-in as "([^"]*)"$/) do |name|
  user = User.find_by(name: name)
  login_as(user, scope: :user)
end

Given(/^I send a mail$/) do
  steps %Q{
    And I am on the "home page"
    And I click on the "Inbox" link
    And I click on the "Compose" link
    And I select "Jenny" from "conversation[recipients][]"
    And I fill in "conversation[subject]" with "test subject"
    And I fill in "conversation[body]" with "test body"
    And I click on the "Send Message" button
    Then I should see "Your message was successfully sent!"
  }
end

Then(/^I should see "([^"]*)" button$/) do |button|
  expect(page).to have_button(button)
end

Given(/^I select "([^"]*)" from "([^"]*)"$/) do |value, dropdown_box|
  select(value, from: dropdown_box)
end
