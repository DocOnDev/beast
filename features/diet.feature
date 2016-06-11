Feature: Diet

  Scenario: Diet Index
    When I visit the diets page
    Then I should see a diets list

  Scenario: Create Diet
    When I visit the diets page
    And I add an active diet with the description "Test Diet"
    Then I should see the diet with the description "Test Diet"

  Scenario: Diets must be for unique time periods
    Given I have a diet active from 6-1-2016 to 9-15-2016
    When I add a diet from 7-4-2016 to 7-10-2016
    Then I should see an error message
    And I should not have a diet from 7-4-2016 to 7-10-2016

  Scenario: Create Intakes
    Given a diet without intakes
    When I add an intake
    Then I should see the intake was updated
