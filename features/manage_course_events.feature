@course_events
Feature: Course Events
  In order to have course_events on my website
  As an administrator
  I want to manage course_events

  Background:
    Given I am a logged in refinery user
    And I have no course_events

  @course_events-list @list
  Scenario: Course Events List
   Given I have course_events titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of course_events
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @course_events-valid @valid
  Scenario: Create Valid Course Event
    When I go to the list of course_events
    And I follow "Add New Course Event"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 course_event

  @course_events-invalid @invalid
  Scenario: Create Invalid Course Event (without title)
    When I go to the list of course_events
    And I follow "Add New Course Event"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 course_events

  @course_events-edit @edit
  Scenario: Edit Existing Course Event
    Given I have course_events titled "A title"
    When I go to the list of course_events
    And I follow "Edit this course_event" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of course_events
    And I should not see "A title"

  @course_events-duplicate @duplicate
  Scenario: Create Duplicate Course Event
    Given I only have course_events titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of course_events
    And I follow "Add New Course Event"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 course_events

  @course_events-delete @delete
  Scenario: Delete Course Event
    Given I only have course_events titled UniqueTitleOne
    When I go to the list of course_events
    And I follow "Remove this course event forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 course_events
 