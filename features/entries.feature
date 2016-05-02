Feature: entry

  Scenario: Entries Listing
    Given there are 6 entries
    When I visit the home page
    Then I should see a list of 6 entries

  Scenario: Create Listing
    Given I am on the homepage
    And I have no food entry for today
    When I create a food entry with the description "Scenario Description"
    Then I should see the "Scenario Description" food entry
