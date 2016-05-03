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

Given(/^I have an existing recipe with no web page$/) do
  @recipe = FactoryGirl.create(:recipe)
  visit edit_recipe_path(@recipe)
end

When(/^I assign the web page "([^"]*)"$/) do |web_page|
  fill_in "recipe_web_page", :with => web_page
  click_button "Update Recipe"
end

Then(/^I should see the recipe with a link to "([^"]*)" in the recipe listing$/) do |web_page|
  page.should have_selector("a[href='#{web_page}']")
end

When(/^I attempt to assign the web page "([^"]*)"$/) do |web_page|
  fill_in "recipe_web_page", :with => web_page
  click_button "Update Recipe"
end

Then(/^I should see an error message$/) do
  page.should have_content("error")
end
