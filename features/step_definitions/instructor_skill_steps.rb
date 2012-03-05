Given /^I have no instructor_skills$/ do
  InstructorSkill.delete_all
end


Then /^I should have ([0-9]+) instructor_skills?$/ do |count|
  InstructorSkill.count.should == count.to_i
end
