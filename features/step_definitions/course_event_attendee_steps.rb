Given /^I have no course_event_attendees$/ do
  CourseEventAttendee.delete_all
end


Then /^I should have ([0-9]+) course_event_attendees?$/ do |count|
  CourseEventAttendee.count.should == count.to_i
end
