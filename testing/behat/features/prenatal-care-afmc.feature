# features/prenatal-care-afmc.feature
Feature: Prenatal Care AFMC
  For our facilities we offer Prenatal Care at AFMC 
  As any user
  I need to be able to load the Prenatal Care page for AFMC 

  # Prenatal Care AFMC
  Scenario: Prenatal Care at AFMC 
    Given I am on "/facilities/prenatal-care-afmc"
    Then I should see "Prenatal Care"
    And I should see "Call today for an appointment (805) 652-6100"
    And I should see "We have a nationally recognized, award-winning Family Medicine Residency program"
