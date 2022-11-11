Feature: User can create or update a status
    As a Dining Hall Employee, 
    So that I can inform students of all currently stocked items, 
    I want to create or update stauses.

Background: The dining hall has some existing menu items
    Given these Items: 
    | name  | description     | meal_of_day | ingredients            | calories | allergens    | diet              | status   | 
    | water | water flavored  | Breakfast   | water                  | 0        |              | vegan, vegetarian |          |
    | steak | grilled wagyu   | Dinner      | Beef, Salt, Pepper     | 500      |              |                   |          |
    | pizza | italian delacacy| Lunch       | dough, marinara, cheese| 300      | dairy, gluten| vegitarian        | available| 

Scenario: Create status for item:
    Given I am on the menu index page
    Then I click on "steak"
    Then I should be on the show page for "steak"
    Then I click on "Update Menu Item"
    Then I should not see "availible"
    When I fill in the following:
        |Field | Value    |
        |Status| available|
    And I press "Update Menu Item"
    Then I should see "available"

Scenario: Update status for item:
    Given I am on the menu index page
    Then I click on "pizza"
    Then I should be on the show page for "pizza"
    Then I click on "Update Menu Item"
    Then I should see "available"
    And I should not see "out of stock"
    When I fill in the following:
        |Field | Value    |
        |Status| out of stock|
    And I press "Update Menu Item"
    Then I should see "out of stock"
    
Scenario: Cancel Updating Status:
    Given I am on the menu index page
    Then I click on "pizza"
    Then I should be on the show page for "pizza"
    Then I click on "Update Menu Item"
    Then I click on "Cancel"
    Then I should be on the show menu item page for "pizza"