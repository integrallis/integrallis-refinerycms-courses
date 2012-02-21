Given /^I have no course_parts$/ do
  CoursePart.delete_all
end


Then /^I should have ([0-9]+) course_parts?$/ do |count|
  CoursePart.count.should == count.to_i
end
