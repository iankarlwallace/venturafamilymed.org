# features/homepage.feature
Feature: Homepage
  In order to access the website
  As any user
  I need to be able to load the homepage as a visitor

  Scenario: Loading the homepage as a visitor
    Given I am on the homepage
    Then I should see "Log in"
    And I should see "phone: (805) 652-6228"
