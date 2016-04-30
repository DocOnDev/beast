Feature: Home page

  Scenario: Viewing application's home page
    Given I am authenticated
    And I have a diary entry for today with "Home page test diary" narrative
    When I visit the homepage
    Then I should see the "Home page test diary" diary entry
