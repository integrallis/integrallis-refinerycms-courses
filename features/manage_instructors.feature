@instructors
Feature: Instructors
  In order to have instructors on my website
  As an administrator
  I want to manage instructors

  Background:
    Given I am a logged in refinery user
    And I have no instructors

  @instructors-list @list
  Scenario: Instructors List
   Given I have instructors titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of instructors
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @instructors-valid @valid
  Scenario: Create Valid Instructor
    When I go to the list of instructors
    And I follow "Add New Instructor"
    And I fill in "First Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 instructor

  @instructors-invalid @invalid
  Scenario: Create Invalid Instructor (without first_name)
    When I go to the list of instructors
    And I follow "Add New Instructor"
    And I press "Save"
    Then I should see "First Name can't be blank"
    And I should have 0 instructors

  @instructors-edit @edit
  Scenario: Edit Existing Instructor
    Given I have instructors titled "A first_name"
    When I go to the list of instructors
    And I follow "Edit this instructor" within ".actions"
    Then I fill in "First Name" with "A different first_name"
    And I press "Save"
    Then I should see "'A different first_name' was successfully updated."
    And I should be on the list of instructors
    And I should not see "A first_name"

  @instructors-duplicate @duplicate
  Scenario: Create Duplicate Instructor
    Given I only have instructors titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of instructors
    And I follow "Add New Instructor"
    And I fill in "First Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 instructors

  @instructors-delete @delete
  Scenario: Delete Instructor
    Given I only have instructors titled UniqueTitleOne
    When I go to the list of instructors
    And I follow "Remove this instructor forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 instructors
 