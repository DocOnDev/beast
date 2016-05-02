Given(/^there are (\d+) entries$/) do |entry_count|
  created_entries = FactoryGirl.create_list(:entry, entry_count.to_i)
end

Then(/^I should see a list of (\d+) entries$/) do |entry_count|
  page.should have_css("table tbody tr", :count=>(entry_count.to_i))
end

Given(/^I have no food entry for today$/) do
end

When(/^I create a food entry with the description "([^"]*)"$/) do |description|
  entry = FactoryGirl.build(:entry, description: description)
  visit new_entry_path
  select entry.food_group.name, :from => "entry_food_group_id"
  fill_in "entry_portion", :with => entry.portion
  fill_in "entry_description", :with => description
  click_button "Create Entry"
end

Then(/^I should see the "([^"]*)" food entry$/) do |description|
  page.should have_content(description)
end

Given(/^I have a food entry for today with the description "([^"]*)"$/) do |description|
  @entry = FactoryGirl.create(:entry, description: description)
end

When(/^I update the food entry with the description "([^"]*)"$/) do |description|
  visit edit_entry_path(@entry)
  fill_in "entry_description", :with => description
  click_button "Update Entry"
end
