Feature: entry

  Scenario: Entries Listing
    Given there are 6 entries
    When I visit the home page
    Then I should see a list of 6 entries

  Scenario: Create Entry
    Given I am on the homepage
    And I have no food entry for today
    When I create a food entry with the description "Scenario Description"
    Then I should see the "Scenario Description" food entry

  Scenario: Update Entry
    Given I am on the homepage
    And I have a food entry for today with the description "Scenario Description"
    When I update the food entry with the description "Updated Description"
    Then I should see the "Updated Description" food entry
