Feature: User can create a new menu item
    As a Dining Hall Employee, 
    So that I can inform students of new menu items, 
    I want to create new menu items. 

Background: The dining hall has some existing menu items
    Given these Items: 
    | name | description | meal_of_day | ingredients | calories | allergens | diet | 
    | water | water flavored | Breakfast | water | 0 | | vegan, vegetarian |
    | steak | grilled wagyu | Dinner | Beef, Salt, Pepper | 500 | | |
    # Will eventually need to account for admins 

Scenario: Create a new menu item 
    Given I am on the menu index page
    Then I should see "water" 
    And I should see "steak" 
    But I should not see "milk"
    #When I press "Sign in" etc (login stuff)
    And I should see "New Menu Item"
    When I press "New Menu Item"
    Then I should be on the new menu item page 
    When I fill in the following: 
        | Field | Value | 
        | Name | milk | 
        | Description | milky | 
        | Meal of day | breakfast | 
        | Ingredients | milk | 
        | Calories | 10 | 
        | Allergens | dairy | 
        | Diet | Vegetarian | 

    And I press "Create Menu Item" 
    Then I should be on the menu index page 
    And I should see "Menu Item milk successfully created"
    And I should see "milk" 
    And I should see that "milk" is made of "milk"


#Eventually add scenarios that check privileges