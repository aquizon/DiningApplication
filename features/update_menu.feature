Feature: User can update an existing menu item
    As a Dining Hall Employee, 
    So that I can inform students of changes in menu items, 
    I want to update existing menu items. 

Background: The dining hall has some existing menu items
    Given these Items: 
    | name | description | meal_of_day | ingredients | calories | allergens | diet | 
    | water | water flavored | Breakfast | water | 0 | | vegan, vegetarian |
    | steak | grilled wagyu | Dinner | Beef, Salt, Pepper | 500 | | |
    Given these Users:
      | email | password | admin |
      | admin@colgate.edu | Colgate13 | true |
      | user@colgate.edu | Colgate13 | false |

Scenario: Update a menu item without logging in
    Given I am on the menu index page
    Then I should see "water"
    And I should see "steak"
    When I press "steak"
    Then I should be on the show menu item page for "steak"
    But I should not see "Update Menu Item"

Scenario: Update a menu item
    Given I am on the menu index page
    Then I should see "water" 
    And I should see "steak" 
    When I press "steak"
    Then I should be on the show menu item page for "steak"
    And I should not see "Update Menu Item"
    When I press "Sign in"
    And I login as "admin@colgate.edu" and "Colgate13"
    Given I am on the the show menu item page for "steak"
    And I should see "Update Menu Item"
    When I press "Update Menu Item"
    Then I should be on the edit menu item page for "steak"
    When I change the "Name" to "wagyu beef"
    And I press "Update Menu Item"
    Then I should be on the show menu item page for "wagyu beef"
    And I should see "wagyu beef was successfully updated"
    And I should not see "steak"
    
#Scenario: Non-admins shouldn't be allowed on the update menu item page
#    Given I am on the update menu item page
#    Then I should see "Only admin users can update menu items"

