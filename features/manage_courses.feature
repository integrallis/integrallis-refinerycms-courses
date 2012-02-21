@courses
Feature: Courses
  In order to have courses on my website
  As an administrator
  I want to manage courses

  Background:
    Given I am a logged in refinery user
    And I have no courses

  @courses-list @list
  Scenario: Courses List
   Given I have courses titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of courses
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @courses-valid @valid
  Scenario: Create Valid Course
    When I go to the list of courses
    And I follow "Add New Course"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 course

  @courses-invalid @invalid
  Scenario: Create Invalid Course (without title)
    When I go to the list of courses
    And I follow "Add New Course"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 courses

  @courses-edit @edit
  Scenario: Edit Existing Course
    Given I have courses titled "A title"
    When I go to the list of courses
    And I follow "Edit this course" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of courses
    And I should not see "A title"

  @courses-duplicate @duplicate
  Scenario: Create Duplicate Course
    Given I only have courses titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of courses
    And I follow "Add New Course"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 courses

  @courses-delete @delete
  Scenario: Delete Course
    Given I only have courses titled UniqueTitleOne
    When I go to the list of courses
    And I follow "Remove this course forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 courses
 