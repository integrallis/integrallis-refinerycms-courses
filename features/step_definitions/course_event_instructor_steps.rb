Given /^I have no course_event_instructors$/ do
  CourseEventInstructor.delete_all
end


Then /^I should have ([0-9]+) course_event_instructors?$/ do |count|
  CourseEventInstructor.count.should == count.to_i
end
