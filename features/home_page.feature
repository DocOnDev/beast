Feature: Home page

  Scenario: With Active Diary Entry
    Given I have a diary entry for today with "Home page test diary" narrative
    When I visit the homepage
    Then I should see the "Home page test diary" diary entry
    And I should see the "Update Diary" button

  Scenario: Update Diary entry
    Given I am on the homepage
    And I have a diary entry for today with "Home page test diary" narrative
    When I update the diary Entry narrative with "This is the new narrative"
    Then I should see the "This is the new narrative" diary entry

  Scenario: Without Active Diary Entry
    Given I have no diary entry for today
    When I visit the homepage
    Then I should not see a diary entry

  Scenario: Create Diary entry
    Given I am on the homepage
    And I have no diary entry for today
    When I create a diary entry with narrative "Scenario Narrative"
    Then I should see the "Scenario" diary entry
