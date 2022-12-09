Feature: User can create a new menu item
    As a Dining Hall Employee, 
    So that I can create a new menu to add items to, 
    I want to create new menus. 

Background: The dininghall has no menus
    Given these Dininghalls:
        |name              |hours                                             |
        |Frank Dining Hall | 7:30am - 12:00am |
        | Coop | 7:30am - 12:00am |
    Given these Users:
      | email | password | admin |
      | admin@colgate.edu | Colgate13 | true |

Scenario: Create a new menu item 
    Given I am on the dininghalls index page
    Then I should see "Frank Dining Hall" 
    And I should see "View Menus" 
    When I press "Sign in"
    And I login as "admin@colgate.edu" and "Colgate13"
    Given I am on the menu index page for "Frank Dining Hall"
    And I should see "Create New Menu"
    When I press "Create New Menu"
    Then I should be on the new menu page 
    When I put in "Late Night" for "Meal of day" 
    And I press "Create Menu" 
    Then I should be on the menu show page for "Late Night"
    And I should see "Menu Late Night successfully created"
    And I should see "No Items Available"
    And I should see "Hours:"
