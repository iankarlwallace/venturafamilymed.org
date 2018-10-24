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
    And I should see "Class of 2021"
    And I should see "Class of 2020"
    And I should see "Class of 2019"
    And I should see "Faculty"
    And I should see "We're so glad you've taken the time to get to know us a little better here at Ventura Family Medicine."
    And I should see "Read on to learn about:"
    And I should see "Applying to the residency program"
    And I should see "The residency curriculum"
    And I should see "Benefits available to residents"
    And I should see "Rotating with us as a medical student"
    And I should see "Life in Ventura, California"
    And I should see "Alumni"

  #Meet Us Classes of 2021, 2020, and 2019, Faculty, Alumni, Global Health
  Scenario Outline: Meet us Class Testing
    Given I am on "<url>"
    Then I should see "<title>"
    And I should see "<resident>"

    Examples:
      | url                    | title         | resident          |
      | /meet-us/class-of-2021 | Class of 2021 | James Ahern, MD   |
      | /meet-us/class-of-2020 | Class of 2020 | Helen Ashton, MD  |
      | /meet-us/class-of-2019 | Class of 2019 | Abigail Nimz, MD  |
      | /meet-us/faculty       | Faculty       | David Araujo, M.D.|
      | /meet-us/alumni        | Alumni        | Ventura Family Medicine Alumni |
      | /meet-us/global-health | Global Health | Anna Rogers |

  #Meet Us Class of 2021 Residents
  Scenario Outline: Meet Us Class of 2021 Names
    Given I am on "/meet-us/class-of-2021"
    Then I should see "<resident>"

    Examples:
    | resident                 |
    | James Ahern, MD          |
    | Gabrielle Flamm, MD      |
    | Khloe Frank, MD          |
    | Samuel Grossman, MD      |
    | Christopher Lam, MD      |
    | Matthew Lamon, DO        |
    | Thanh Van Mai, MD        |
    | Robert Nieland, DO       |
    | John Nuhn, MD            |
    | Mariela Nutter, MD       |
    | Carolyn Pearce, MD       |
    | Yohan Perera, MD         |
    | Tanya Shah, MD           |
    | Daryl Spak, MD           |
    | Jacob West, MD           |

  #Meet Us Class of 2020 Residents
  Scenario Outline: Meet Us Class of 2020 Names
    Given I am on "/meet-us/class-of-2020"
    Then I should see "<resident>"

    Examples:
    | resident                 |
    | Helen Ashton, MD         |
    | Caitlin Bradshaw, DO     |
    | Rachel Corbin, MD        |
    | Sara Dunham, MD          |
    | Jennifer Gima, MD        |
    | Emilie Halbach, MD       |
    | Orin Hansen, MD          |
    | Jong Kim, MD             |
    | Luyang Liu, MD           |
    | Jon-Peter Meckel, DO     |
    #    | Maura Olcese, MD         |
    | Philip Prusack, MD       |
    | Magdalena Reinsvold, MD  |
    | Cesar Soria, MD          |
    | Rina Suzuki, DO          |
    | Tommaso Tosini, MD       |
    | Kevin Yi, MD             |

  #Meet Us Class of 2019 Residents
  Scenario Outline: Meet Us Class of 2019 Names
    Given I am on "/meet-us/class-of-2019"
    Then I should see "<resident>"

    Examples:
    | resident                 |
    | Abigail Nimz, MD         |
    | Catherine Sendaydiego, MD|
    | Tyler Barr, MD           |
    | Annie Chang, MD          |
    | Samantha Chirunomula, MD |
    | Audrey Gray, MD          |
    | Jennifer Johnston, MD    |
    | Shadia Karim, MD         |
    | Raul Meza, MD            |
    | Eric Monaco, MD          |
    | James Rohlfing, MD       |
    | Jesus Ruiz, MD           |
    | Carmen Stellar, MD       |

  #Meet Us Faculty
  Scenario Outline: Meet Us Faculty Names
    Given I am on "/meet-us/faculty"
    Then I should see "<faculty>"

    Examples:
    | faculty                  |
    | David Araujo, M.D.       |
    | Leslie-Lynn Pawson, M.D. |
    | Cheryl Lambing, M.D.     |
    | Kristi Schoeld, M.D.     |
    | Neil Jorgensen, M.D.     |
    | Jim Helmer, M.D.         |
    | Sheri Dickstein, M.D.    |
    | Jacob David, M.D.        |
    | Zach Zwolak, D.O.        |
    | Wally Baker, M.D.        |
    | Tipu V. Khan, M.D., FAAFP|
    | Ron Bale, Ph.D.          |
    | Ian Wallace, M.D.        |
    | Daniel Cox, M.D.         |
