Feature: Diet

  Scenario: Diet Index
    When I visit the diets page
    Then I should see a diets list

  Scenario: Create Diet
    When I visit the diets page
    And I add an active diet with the description "Test Diet"
    Then I should see the diet with the description "Test Diet"

  Scenario: Create Intakes
    Given a diet without intakes
    When I add an intake
    Then I should see the intake was updated
