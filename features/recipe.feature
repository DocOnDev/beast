Feature: Recipe

  Scenario: Recipe Index
    When I visit the recipes page
    Then I should see a recipes list

  Scenario: Create Recipe
    Given I visit the recipes page
    When I add a recipe with the name "Feature Recipe"
    Then I should see the recipe with the name "Feature Recipe"
