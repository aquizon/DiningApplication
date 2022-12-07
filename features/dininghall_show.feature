Feature: Customer can click on a dining hall to view details
    As a student, 
    So that I can easily see dininghall menus and hours
    I want to be able to see more details than a breif description

Background: The dininghall has a few items
    Given these Dininghalls:
        |name              |hours                                              |breakfast_hours|menu                             |
        |"Frank Dining Hall" | "7:30am - 12:00am" | breakfast_hours: "7:00am - 10:00am" | "Current Menu"|
        | "Coop" | "7:30am - 12:00am" | breakfast_hours: "7:00am - 10:00am" | "Current Menu"|

Scenario: Click on a dininghall for more details
    Given I am on the index page
    When I click on "Frank Dining Hall"
    Then I should be on the show dining hall page for "\"Frank Dining Hall\""
    And I should not see "4:45pm"
