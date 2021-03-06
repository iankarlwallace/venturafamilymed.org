#features/rotationpages.feature
Feature: Rotation Pages
  Rotation Pages that house all the little tid bits about the rotations
  As a resident (with proper login)
  You are allowed to download all kinds of wonderful PDF's and presentations
  These do not work currently due to login problems

  Background:
    Given I am on "/rotations"
    And I fill in "username" with "resident"
    And I fill in "password" with "play"
    And I press button with Xpath "//div[1]/div/div/main/div[2]/form/fieldset/div[3]/div/button"
    Then I should be on "/rotations"
    Then I should see "Rotations"
    And I should see "AFMC"
    And I should see "Ultrasound"

  @javascript 
  Rotation Pages Diabetes
  Scenario: Diabetes
      When I am on "/rotations/diabetes"
      Then I should see "Contact information for DM experts:"
      And I should see "Dr. Teresa Cho:"
      And I should see "Dr. Catherine Sever:"
      And I should see "Diabetes Links"
      And I should see "HANDOUTS & LECTURES"
      And I should see "Outpatient Diabetes Management (2017)"
      And I should see "Outpatient Diabetes Management (2015)"
      And I should see "Transition Algorithm"
      And I press "Log out"
