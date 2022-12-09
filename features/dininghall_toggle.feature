Feature: User can create a new dining hall
    As a Student
    So that I can navigate the website quicker
    I want to be able to toggle between dining halls on their show page

Background: The dininghall has a few items
    Given these Dininghalls:
        |name                |hours                |menu           |
        | "Frank Dining Hall" | "6:30am - 12:00am" | "Current Menu"|
        | "Coop"             | "7:30am - 12:00am" | "Current Menu"|
        | "Donnovan's Pub"   | "8:30am - 12:00am" | "Current Menu"|
        | "Chobani"          | "7:45am - 12:00am" | "Current Menu"|
Scenario: Switch from Chobani to Frank
    Given I am on the index page
    And I press "Chobani"
    Then I should be on the "\"Chobani\"" page
    And I press "Back"
    And I press "Frank Dining Hall"
    Then I should be on the "\"Frank Dining Hall\"" page