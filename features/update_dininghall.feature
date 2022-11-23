Feature: User can update an existing dining hall
    As a Dining Hall Employee, 
    So that I can inform students of changes in dining hall hours, 
    I want to update existing dining halls. 

Background: There are some dining halls
    Given these Dininghalls:
        |name                |hours               |breakfast_hours                      |menu           |
        |"Frank Dining Hall" | "7:30am - 12:00am" | breakfast_hours: "7:00am - 10:00am" | "Current Menu"|
        | "Coop"             | "7:30am - 12:00am" | breakfast_hours: "7:00am - 10:00am" | "Current Menu"|

Scenario: Update a menu item
    Given I am on the index page
    Then I should see "Frank Dining Hall" 
    And I should see "Coop" 
    When I click on "Coop"
    Then I should be on the show dining hall page for "Coop"
    And I should see "Update Dininghall"
    When I press "Update Dininghall"
    Then I should be on the edit dining hall page for "\"Coop\""
    When I change the "Name" to "O'Connor"
    And I press "Update Dininghall"
    Then I should be on the show dining hall page for "O'Connor"
    And I should see "O'Connor was successfully updated"
    And I should not see "Coop"
    

