@attendees
Feature: Attendees
  In order to have attendees on my website
  As an administrator
  I want to manage attendees

  Background:
    Given I am a logged in refinery user
    And I have no attendees

  @attendees-list @list
  Scenario: Attendees List
   Given I have attendees titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of attendees
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @attendees-valid @valid
  Scenario: Create Valid Attendee
    When I go to the list of attendees
    And I follow "Add New Attendee"
    And I fill in "First Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 attendee

  @attendees-invalid @invalid
  Scenario: Create Invalid Attendee (without first_name)
    When I go to the list of attendees
    And I follow "Add New Attendee"
    And I press "Save"
    Then I should see "First Name can't be blank"
    And I should have 0 attendees

  @attendees-edit @edit
  Scenario: Edit Existing Attendee
    Given I have attendees titled "A first_name"
    When I go to the list of attendees
    And I follow "Edit this attendee" within ".actions"
    Then I fill in "First Name" with "A different first_name"
    And I press "Save"
    Then I should see "'A different first_name' was successfully updated."
    And I should be on the list of attendees
    And I should not see "A first_name"

  @attendees-duplicate @duplicate
  Scenario: Create Duplicate Attendee
    Given I only have attendees titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of attendees
    And I follow "Add New Attendee"
    And I fill in "First Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 attendees

  @attendees-delete @delete
  Scenario: Delete Attendee
    Given I only have attendees titled UniqueTitleOne
    When I go to the list of attendees
    And I follow "Remove this attendee forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 attendees
 