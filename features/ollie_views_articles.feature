Feature: Ollie an OLIOer views and likes some articles

Background:
    Given I am on the home page

Scenario: Ollie views what is available
    Then I can see multiple articles are available
    And I can see the "Cat scratching hanger" article is available

Scenario: Ollie likes an article and can see the counter
    Then I can see the "Cat scratching hanger" article is available
    And I can see the the like counter on "Cat scratching hanger" is "0"
    When I click like on the "Cat scratching hanger"
    Then I can see the flash message with the text "Successfully liked this article"
    Then I can see the the like counter on "Cat scratching hanger" is "1"