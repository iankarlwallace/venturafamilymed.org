#features/meetus.feature
Feature: Meet Us
  To catalog all our faculty and residents
  As a visitor
  You are allowed to see the bios from each of the classes and the faculty

  #Meet Us Starting Page
  Scenario: Meet Us Landing Page
    Given I am on "/meet-us"
    Then I should see "Our Residents and Faculty"
    And I should see "We'd like to introduce you to our residency family."
    And I should see "We believe in creating a warm, respectful learning environment, and intentionally cultivate our community to be supportive and welcoming."
    And I should see "While the clinical training here is top-notch, we think you'll find that the quality of the people is even better."
    And I should see "Click the images below for brief biographies of each of our doctors."
    And I should see "Class of 2020"
    And I should see "Class of 2019"
    And I should see "Class of 2018"
    And I should see "Faculty"
    And I should see "We're so glad you've taken the time to get to know us a little better here at Ventura Family Medicine."
    And I should see "Read on to learn about:"
    And I should see "Applying to the residency program"
    And I should see "The residency curriculum"
    And I should see "Benefits available to residents"
    And I should see "Rotating with us as a medical student"
    And I should see "Life in Ventura, California"
    And I should see "Alumni"

  #Meet Us Class of 2020
  Scenario: Meet us Class of 2020
    Given I am on "/meet-us/class-of-2020"
    Then I should see "Class of 2020"
    And I should see "Helen Ashton, MD"
    # ... the rest of the 2020 residents ...

  #Meet Us Class of 2019
  Scenario: Meet us Class of 2019
    Given I am on "/meet-us/class-of-2019"
    Then I should see "Class of 2019"
    And I should see "Abigail Nimz, MD"
    # ... the rest of the 2019 residents ...

  #Meet Us Class of 2018
  Scenario: Meet us Class of 2018
    Given I am on "/meet-us/class-of-2018"
    Then I should see "Class of 2018"
    And I should see "Matthew Combs, MD"
    # ... the rest of the 2018 residents ...
