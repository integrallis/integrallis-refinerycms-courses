@parts
Feature: Parts
  In order to have parts on my website
  As an administrator
  I want to manage parts

  Background:
    Given I am a logged in refinery user
    And I have no parts

  @parts-list @list
  Scenario: Parts List
   Given I have parts titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of parts
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @parts-valid @valid
  Scenario: Create Valid Part
    When I go to the list of parts
    And I follow "Add New Part"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 part

  @parts-invalid @invalid
  Scenario: Create Invalid Part (without title)
    When I go to the list of parts
    And I follow "Add New Part"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 parts

  @parts-edit @edit
  Scenario: Edit Existing Part
    Given I have parts titled "A title"
    When I go to the list of parts
    And I follow "Edit this part" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of parts
    And I should not see "A title"

  @parts-duplicate @duplicate
  Scenario: Create Duplicate Part
    Given I only have parts titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of parts
    And I follow "Add New Part"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 parts

  @parts-delete @delete
  Scenario: Delete Part
    Given I only have parts titled UniqueTitleOne
    When I go to the list of parts
    And I follow "Remove this part forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 parts
 