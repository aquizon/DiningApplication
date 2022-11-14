Feature: Show when each menu is being served until
    As a student,
    So that I know how long the food on each menu will be served,
    I want to see the time range for each meal of the day

Background: The dining hall has some existing menu items
    Given these Items: 
    | name | description | meal_of_day | ingredients | calories | allergens | diet | 
    | water | water flavored | Breakfast | water | 0 | | vegan, vegetarian |
    | Egg Burger | Very Eggy | Lunch | Egg and Burger | 500 | | |
    | steak | grilled wagyu | Dinner | Beef, Salt, Pepper | 500 | | |

Scenario: Viewing Menu Hours
    Given I am on the menu index page
    Then I should see "Breakfast Menu"
    When I press "Breakfast Menu"
    Then I should be on the menu index page for "Breakfast"
    And I should see "Menu Hours: 7:30am - 11:00am"