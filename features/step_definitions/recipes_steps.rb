When(/^I visit the recipes page$/) do
  visit recipes_path
end

Then(/^I should see a recipes list$/) do
  page.should have_content("Recipes")
end

When(/^I add a recipe with the name "([^"]*)"$/) do |name|
  visit new_recipe_path
  fill_in "recipe_name", :with => name
  click_button "Create Recipe"
end

Then(/^I should see the recipe with the name "([^"]*)"$/) do |name|
  page.should have_content(name)
end
