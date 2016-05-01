Feature: entry

  Scenario: Entries Listing
    Given there are 6 entries
    When I visit the home page
    Then I should see a list of 6 entries
