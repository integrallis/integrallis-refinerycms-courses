@part_prerequisites
Feature: Part Prerequisites
  In order to have part_prerequisites on my website
  As an administrator
  I want to manage part_prerequisites

  Background:
    Given I am a logged in refinery user
    And I have no part_prerequisites

  @part_prerequisites-list @list
  Scenario: Part Prerequisites List
   Given I have part_prerequisites titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of part_prerequisites
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @part_prerequisites-valid @valid
  Scenario: Create Valid Part Prerequisite
    When I go to the list of part_prerequisites
    And I follow "Add New Part Prerequisite"
    And I fill in "Reason" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 part_prerequisite

  @part_prerequisites-invalid @invalid
  Scenario: Create Invalid Part Prerequisite (without reason)
    When I go to the list of part_prerequisites
    And I follow "Add New Part Prerequisite"
    And I press "Save"
    Then I should see "Reason can't be blank"
    And I should have 0 part_prerequisites

  @part_prerequisites-edit @edit
  Scenario: Edit Existing Part Prerequisite
    Given I have part_prerequisites titled "A reason"
    When I go to the list of part_prerequisites
    And I follow "Edit this part_prerequisite" within ".actions"
    Then I fill in "Reason" with "A different reason"
    And I press "Save"
    Then I should see "'A different reason' was successfully updated."
    And I should be on the list of part_prerequisites
    And I should not see "A reason"

  @part_prerequisites-duplicate @duplicate
  Scenario: Create Duplicate Part Prerequisite
    Given I only have part_prerequisites titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of part_prerequisites
    And I follow "Add New Part Prerequisite"
    And I fill in "Reason" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 part_prerequisites

  @part_prerequisites-delete @delete
  Scenario: Delete Part Prerequisite
    Given I only have part_prerequisites titled UniqueTitleOne
    When I go to the list of part_prerequisites
    And I follow "Remove this part prerequisite forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 part_prerequisites
 