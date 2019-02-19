# features/homepage.feature
Feature: Homepage
  In order to access the website
  As any user
  I need to be able to load the homepage as a visitor

  # Homepage Default Upper Level Menu
  Scenario: Homepage upper right menu
    Given I am on the homepage
    Then I should see "Cerner"
    And I should see "Webmail"
    And I should see "PACS"
    And I should see "New Innovations"
    And I should see "TigerText"
    And I should see "CURES"
    And I should see "Log in"
    And I should see "Search"

  # Homepage Default Menu
  Scenario: Homepage menu should be visible
    Given I am on the homepage
    Then I should see "Home"
    And I should see "Meet Us"
    And I should see "Applicants"
    And I should see "Students"
    And I should see "Fellowships"
    And I should see "Facilities"
    And I should see "CME"
    And I should see "Cerner"
    And I should see "Rotation Pages"

  # Homepage Default Article
  Scenario: Homepage default article
    Given I am on the homepage
    Then I should see "We are full spectrum Family Medicine"
    And I should see "The Family Medicine Residency Program at Ventura County Medical Center (VCMC)"
    And I should see "Ventura Residents establish continuity primary care practices"
    And I should see "Thank you for taking the time to learn more about us."
    And I should see "We are full spectrum Family Medicine. Our graduates are empowered to serve with continuity of care in all settings, valuing all peoples."

  #Homepage Contact Information Footer
  Scenario: Homepage contact information footer
    Given I am on the homepage
    Then I should see "Ventura County Medical Center Family Medicine Residency Program"
    And I should see "Office of Medical Education"
    And I should see "300 Hillmont Avenue, Bldg 340, Room 120"
    And I should see "Ventura, California 93003"
    And I should see "phone: (805) 652-6228"
    And I should see "2019 Ventura Family Medicine"

  #The search function is available from the homepage as well
  Scenario: Homepage search function as visitor
    Given I am on the homepage
    When I fill in "q" with "Global Health"
    And I press "Search"
    Then I should see "Search Terms:"
    And I should see "Ventura Global Health Fellowship"
    And I should see "Results 1 - "
