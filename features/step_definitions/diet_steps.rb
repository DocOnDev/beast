Before do
  step "I am authenticated"
end

When(/^I visit the diets page$/) do
  visit diets_path
end

Then(/^I should see a diets list$/) do
  page.should have_content("Listing Diets")
end

When(/^I add an active diet with the description "([^"]*)"$/) do |description|
  visit new_diet_path
  fill_in "diet_description", :with => description
  click_button "Create Diet"
end

Then(/^I should see the diet with the description "([^"]*)"$/) do |description|
  page.should have_content(description)
end

Given(/^a diet without intakes$/) do
  @diet = FactoryGirl.create(:diet)
end

When(/^I add an intake$/) do
  visit edit_diet_path(@diet)
  page.find_field('diet_intakes_attributes_0_quantity').set(10)
  click_button "Update Diet"
end

Then(/^I should see the intake was updated$/) do
  page.should have_content("successfully updated")
end

Given(/^I have a diet active from (\d+)\-(\d+)\-(\d+) to (\d+)\-(\d+)\-(\d+)$/) do |start_month, start_day, start_year, end_month, end_day, end_year|
  @diet = FactoryGirl.create(:diet, user_id: 1, start_date: Date.new(start_year.to_i, start_month.to_i, start_day.to_i), end_date: Date.new(end_year.to_i, end_month.to_i, end_day.to_i))
end

When(/^I add a diet from (\d+)\-(\d+)\-(\d+) to (\d+)\-(\d+)\-(\d+)$/) do |start_month, start_day, start_year, end_month, end_day, end_year|
  visit new_diet_path
  # @new_diet = FactoryGirl.build(:diet, start: Date.new(start_year.to_i, start_month.to_i, start_day.to_i), end: Date.new(end_year.to_i, end_month.to_i, end_day.to_i))
  page.select start_year, :from => "diet_start_date_1i"
  # page.select start_month, :from => "diet_start_2i"
  page.select start_day, :from => "diet_start_date_3i"

  page.select end_year, :from => "diet_end_date_1i"
  # page.select end_month, :from => "diet_end_2i"
  page.select end_day, :from => "diet_end_date_3i"

  click_button "Create Diet"
end

Then(/^I should not have a diet from (\d+)\-(\d+)\-(\d+) to (\d+)\-(\d+)\-(\d+)$/) do |start_month, start_day, start_year, end_month, end_day, end_year|
  visit diets_path
  page.should_not have_content("#{start_year}-#{start_month}-#{start_day}")
  page.should_not have_content("#{end_year}-#{end_month}-#{end_day}")
end
