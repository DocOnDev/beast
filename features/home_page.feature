Feature: Home page

  Scenario: Update Diary Narrative
    Given I am on the homepage
    And I have a diary entry for today with "Home page test diary" narrative
    When I update the diary Entry narrative with "This is the new narrative"
    Then I should see a diary entry with the narrative "This is the new narrative"

  Scenario: Without Active Diary Narrative
    Given I have no diary entry for today
    When I visit the homepage
    Then I should not see a diary entry

  Scenario: Create Diary Narrative
    Given I am on the homepage
    And I have no diary entry for today
    When I create a diary entry with narrative "Scenario Narrative"
    Then I should see a diary entry with the narrative "Scenario Narrative"
