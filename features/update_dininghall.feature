Feature: User can update an existing dining hall
    As a Dining Hall Employee, 
    So that I can inform students of changes in dining hall hours, 
    I want to update existing dining halls. 

Background: The dininghall has a few items
    Given these Dininghalls:
        |name              |hours                                              |menu                             |
        |"Frank Dining Hall" | "7:30am - 12:00am" | "Current Menu"|
        | "Coop" | "7:30am - 12:00am" | "Current Menu"|
    Given these Users:
      | email | password | admin |
      | admin@colgate.edu | Colgate13 | true |
      
Scenario: Update a dining hall
    Given I am on the index page
    When I press "Sign in"
    And I login as "admin@colgate.edu" and "Colgate13"
    Then I should see "Frank Dining Hall" 
    And I should see "Coop" 
    When I press "Coop"
    Then I should be on the show dining hall page for "\"Coop\""
    And I should see "Update Dininghall"
    When I press "Update Dininghall"
    Then I should be on the edit dining hall page for "\"Coop\""
    When I change the "Name" to "O'Connor"
    And I press "Update Dininghall"
    Then I should be on the show dining hall page for "O'Connor"
    And I should see "O'Connor was successfully updated"
    And I should not see "Coop"
    

