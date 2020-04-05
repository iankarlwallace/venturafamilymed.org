# features/covid-19.feature
Feature: Covid-19
  To support the residents for information on Covid-19
  As any user
  I need to be able to access general/inpatient/outpatient resources

  #Covid-19 Landing paget
  Scenario: Covid-19 Page
    Given I am on "/covid-19"
    Then I should see "General Information"
    And I should see "Information"
    And I should see "Ambulatory/Outpatient"
    And I should see "Covid-19 Frequently Visited"
    And I should see "Tracking Site"
    And I should see "For assistance or questions, contact Ian Wallace at Ian dot Wallace at Ventura dot Org"

  #Covid-19 General Information Page
  Scenario: Covid-19 General Information Page
    Given I am on "/covid-19/residency/general-info"
    Then I should see "COVID Inpatient Huddles"
    And I should see "Google Doc/Drive - COVID-19 Resources"
    And I should see "Resources for COVID-19"

  #Covid-19 Inpatient
  Scenario: Covid-19 Inpatient
    Given I am on "/covid-19/residency/inpatient"
    Then I should see "Model Room Images"
    And I should see "COVID Hospitalist Meetings"
    And I should see "SCCM Critical Care"

  #Covid-19 Outpatient
  Scenario: Covid-19 Outpatient
    Given I am on "/covid-19/residency/ambulatory-outpatient-afmc"
    Then I should see "COVID-19 ICD-10 Related Codes"
    And I should see "AFMC - COVID-19 Info"
