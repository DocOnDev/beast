Feature: Diet

  Scenario: Diet Index
    When I visit the diets page
    Then I should see a diets list

  Scenario: Add Diet
    When I visit the diets page
    And I add an active diet with the description "Test Diet"
    Then I should see the diet with the description "Test Diet"
