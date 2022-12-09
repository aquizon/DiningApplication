Feature: User can destroy an existing menu
    As a Dining Hall Employee, 
    So that I can inform students of changes in menus, 
    I want to delete existing menus. 

Background: The dining hall has some existing menus
    Given these Dininghalls:
        |name              |hours |
        |"Frank Dining Hall" | "7:30am - 12:00am" |

    Given these Menus with "Frank Dining Hall": 
        | meal_of_day | 
        | Breakfast | 
        | Lunch | 
    Given these Users:
      | email | password | admin |
      | admin@colgate.edu | Colgate13 | true |
      | user@colgate.edu | Colgate13 | false |

Scenario: Delete a menu  without logging in
    Given I am on the menu show page for "Lunch"
    Then I should see "Lunch"
    But I should not see "Delete Menu"

Scenario: Delete a menu 
    Given I am on the menu show page for "Lunch"
    Then I should see "Lunch" 
    And I should not see "Delete Menu"
    When I press "Sign in"
    And I login as "admin@colgate.edu" and "Colgate13"
    Given I am on the menu show page for "Lunch"
    And I should see "Delete Menu"
    When I press "Delete Menu"
    Then I should be on the menus index page for "Frank Dining Hall"
    And I should see "Breakfast"
    And I should not see "Lunch"