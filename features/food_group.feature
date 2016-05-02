Feature: Food Group

  Scenario: Index Page
    Given there are 10 food groups
    When I visit the food groups page
    Then I should see a list of 10 food groups

  Scenario: Create a food group
    Given there are 10 food groups
    When I create a food group with the name "Create Scenario Food Group"
    And I visit the food groups page
    Then I should see the "Create Scenario Food Group" food group

  Scenario: Update a food group
    Given a food group with name "Standard Food Group"
    When I update the name to "Scenario Update Food Group"
    Then I should see the "Scenario Update Food Group" food group
