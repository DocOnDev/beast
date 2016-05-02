Before do
  step "I am authenticated"
end

Given(/^there are (\d+) food groups$/) do |group_count|
  created_groups = FactoryGirl.create_list(:food_group, group_count.to_i)
end

When(/^I visit the food groups page$/) do
  visit food_groups_path
end

Then(/^I should see a list of (\d+) food groups$/) do |group_count|
  #TODO: Clean this up - currently have 3 rows from residue in database due to other tests not cleaning up
  page.should have_css("table tbody tr", :count=>(group_count.to_i + 3))
end

When(/^I create a food group with the name "([^"]*)"$/) do |group_name|
  @food_group = FactoryGirl.create(:food_group, name: group_name)
end

Then(/^I should see the "([^"]*)" food group$/) do |group_name|
  page.should have_content(group_name)
end

Given(/^a food group with name "([^"]*)"$/) do |group_name|
  @food_group = FactoryGirl.create(:food_group, name: group_name)
end

When(/^I update the name to "([^"]*)"$/) do |name|
  visit edit_food_group_path(@food_group)
  fill_in "food_group_name", :with => name
  click_button "Update Food group"
end
