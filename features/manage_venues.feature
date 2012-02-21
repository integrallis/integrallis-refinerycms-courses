@venues
Feature: Venues
  In order to have venues on my website
  As an administrator
  I want to manage venues

  Background:
    Given I am a logged in refinery user
    And I have no venues

  @venues-list @list
  Scenario: Venues List
   Given I have venues titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of venues
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @venues-valid @valid
  Scenario: Create Valid Venue
    When I go to the list of venues
    And I follow "Add New Venue"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 venue

  @venues-invalid @invalid
  Scenario: Create Invalid Venue (without name)
    When I go to the list of venues
    And I follow "Add New Venue"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 venues

  @venues-edit @edit
  Scenario: Edit Existing Venue
    Given I have venues titled "A name"
    When I go to the list of venues
    And I follow "Edit this venue" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of venues
    And I should not see "A name"

  @venues-duplicate @duplicate
  Scenario: Create Duplicate Venue
    Given I only have venues titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of venues
    And I follow "Add New Venue"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 venues

  @venues-delete @delete
  Scenario: Delete Venue
    Given I only have venues titled UniqueTitleOne
    When I go to the list of venues
    And I follow "Remove this venue forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 venues
 