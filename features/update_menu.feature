Feature: User can update an existing menu item
    As a Dining Hall Employee, 
    So that I can inform students of changes in menu items, 
    I want to update existing menu items. 

Background: The dining hall has some existing menu items
    Given these Items: 
    | name | description | meal_of_day | ingredients | calories | allergens | diet | 
    | water | water flavored | Breakfast | water | 0 | | vegan, vegetarian |
    | steak | grilled wagyu | Dinner | Beef, Salt, Pepper | 500 | | |
    # Will eventually need to account for admins 

Scenario: Update a menu item
    Given I am on the menu index page
    Then I should see "water" 
    And I should see "steak" 
    #When I press "Sign in" etc (login stuff)
    When I press "steak"
    Then I should be on the show menu item page for "steak"
    And I should see "Update Menu Item"
    When I press "Update Menu Item"
    Then I should be on the edit menu item page for "steak"
    When I change the "Name" to "wagyu beef"
    And I press "Update Menu Item"
    Then I should be on the show menu item page for "wagyu beef"
    And I should see "wagyu beef was successfully updated"
    And I should not see "steak"
    

