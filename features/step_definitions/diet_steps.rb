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
