Feature: Food Group

  Scenario: Index Page
    Given there are 10 food groups
    When I visit the food groups page
    Then I should see a list of 10 food groups

  Scenario: Create a food group
    Given there are 10 food groups
    When I create a food group with the name "Feature Food Group"
    And I visit the food groups page
    Then I should see the "Feature Food Group" food group
