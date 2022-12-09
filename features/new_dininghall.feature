
Feature: User can create a new dining hall
    As a Dining Hall Employee, 
    So that I can inform students of all dining options on campus, 
    I want to create new dining halls. 

Background: The dininghall has a few items
    Given these Dininghalls:
        |name              |hours                                              |
        |"Frank Dining Hall" | "7:30am - 12:00am" |
        | "Coop" | "7:30am - 12:00am" |
    Given these Users:
      | email | password | admin |
      | admin@colgate.edu | Colgate13 | true |
      | user@colgate.edu | Colgate13 | false |

  Scenario: Create a new dining hall without logging in
    Given I am on the index page
    Then I should see "Frank Dining Hall"
    And I should see "Coop"
    But I should not see "New Dining Hall"


Scenario: Create a new dining hall as an admin
    Given I am on the index page
    And I should not see "New Dining Hall"
    When I press "Sign in"
    And I login as "admin@colgate.edu" and "Colgate13"
    Then I should be on the index page
    And I should see "New Dining Hall"
    When I press "New Dining Hall"
    Then I should be on the new dining hall page 
    When I fill in the following: 
        | Field | Value | 
        | Name | Chobani | 
        | Hours | 9:00am - 10:00pm | 
    And I press "Create Dining Hall" 
    Then I should be on the index page
    And I should see "Chobani"
    And I should see "10:00pm" 
    And I should not see "4:45pm"

Scenario: Non-admins shouldn't be allowed on the new dining hall page
    Given I am on the new dining hall page
