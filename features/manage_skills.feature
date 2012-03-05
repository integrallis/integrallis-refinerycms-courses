@skills
Feature: Skills
  In order to have skills on my website
  As an administrator
  I want to manage skills

  Background:
    Given I am a logged in refinery user
    And I have no skills

  @skills-list @list
  Scenario: Skills List
   Given I have skills titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of skills
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @skills-valid @valid
  Scenario: Create Valid Skill
    When I go to the list of skills
    And I follow "Add New Skill"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 skill

  @skills-invalid @invalid
  Scenario: Create Invalid Skill (without name)
    When I go to the list of skills
    And I follow "Add New Skill"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 skills

  @skills-edit @edit
  Scenario: Edit Existing Skill
    Given I have skills titled "A name"
    When I go to the list of skills
    And I follow "Edit this skill" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of skills
    And I should not see "A name"

  @skills-duplicate @duplicate
  Scenario: Create Duplicate Skill
    Given I only have skills titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of skills
    And I follow "Add New Skill"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 skills

  @skills-delete @delete
  Scenario: Delete Skill
    Given I only have skills titled UniqueTitleOne
    When I go to the list of skills
    And I follow "Remove this skill forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 skills
 