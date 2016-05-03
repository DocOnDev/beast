Feature: Recipe

  As A consumer of food
  I want to track recipes
  So that I can more easily track my daily intake

  Scenario: Recipe Index
    When I visit the recipes page
    Then I should see a recipes list

  Scenario: Create Basic Recipe
    Given I visit the recipes page
    When I add a recipe with the name "Feature Recipe"
    Then I should see the recipe with the name "Feature Recipe"

  Scenario: Assign Web Page to Existing Recipe
    Given I have an existing recipe with no web page
    When I assign the web page "http://www.foodnetwork.com"
    Then I should see the recipe with a link to "http://www.foodnetwork.com" in the recipe listing

  Scenario: Prevent invalid Web page assignment to Existing Recipe
    Given I have an existing recipe with no web page
    When I attempt to assign the web page "stuff and things"
    Then I should see an error message    
