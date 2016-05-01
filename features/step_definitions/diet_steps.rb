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
  @diet = FactoryGirl.create(:diet, description: description)
  visit new_diet_path
  fill_in "diet_description", :with => @diet.description
  click_button "Create Diet"
end

Then(/^I should see the diet with the description "([^"]*)"$/) do |description|
  page.should have_content(@diet.description)
end
