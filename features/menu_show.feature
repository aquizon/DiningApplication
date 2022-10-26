Feature: Customer can click on a menu item to view details
    As a student, 
    So that I can easily see nutritional information about food that intrests menu
    I want to be able to see more details than a breif description


Background: The menu has a few items
    Given these MenuItems:
        |name              |description                                              |meal_of_day|ingredients                             |calories|allergens   |diet|
        |"Chicken Alfredo" | "Fettucine pasta in a creamy sauce with grilled chicken"| "Dinner"| "Chicken, Alfredo Sauce, Fettucine Pasta"| 400| "Dairy, Gluten"| ""|
        |"Tofu Steak Frites" | "Waygu tofu marinated in a pepper butter, and served with french fries"| "Dinner"| "tofu, Potatoes, Butter, Pepper"| 400| "Dairy, Soy"| "Vegitarian"|

Scenario: Click on a menu item for more details
    Given I am on the MenusIndex page
    When I click on "Chicken Alfredo"
    Then I should be on the Menu Item show page