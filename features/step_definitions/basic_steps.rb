Given(/^I am on the "([^"]*)"$/) do |page|
  case page
   when 'home page' then
     visit '/'
   when 'registration page' then
     visit '/users/sign_up'
   when 'login page' then
     visit '/users/sign_in'
  end
end

Given(/^I click on the "([^"]*)" link$/) do |link|
  click_link_or_button link
end

Then(/^I should be on the "([^"]*)"$/) do |page|
  case page
   when 'home page' then
     expect(current_path).to eq '/'
   when 'registration page' then
     expect(current_path).to eq '/users/sign_up'
   when 'login page' then
     expect(current_path).to eq '/users/sign_in'
  end
end
