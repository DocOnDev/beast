Before do
  step "I am authenticated"
end

Given(/^I have a diary entry for today with "([^"]*)" narrative$/) do |narrative|
  @diary = FactoryGirl.create(:diary, narrative: narrative, user_id: @user.id)
end

Given(/^I am on the homepage$/) do
  step "I visit the homepage"
end

When(/^I visit the home page$/) do
  step "I visit the homepage"
end


When(/^I visit the homepage$/) do
  visit root_path
end

Then(/^I should see the "([^"]*)" diary entry$/) do |narrative|
  page.should have_content(narrative)
end

Then(/^I should see the "([^"]*)" button$/) do |button_text|
  page.should have_button(button_text)
end


Given(/^I have no diary entry for today$/) do
end

Then(/^I should not see a diary entry$/) do
  page.should have_field("diary_narrative", with: "")
end

When(/^I create a diary entry with narrative "([^"]*)"$/) do |narrative|
  fill_in "diary_narrative", :with => narrative
  click_button "Create Diary"
end

When(/^I update the diary Entry narrative with "([^"]*)"$/) do |narrative|
  click_button "Create Diary" # commit the first entry, then update.
  fill_in "diary_narrative", :with => narrative
  click_button "Update Diary"
end
