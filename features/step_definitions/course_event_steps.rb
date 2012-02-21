Given /^I have no course_events$/ do
  CourseEvent.delete_all
end

Given /^I (only )?have course_events titled "?([^\"]*)"?$/ do |only, titles|
  CourseEvent.delete_all if only
  titles.split(', ').each do |title|
    CourseEvent.create(:title => title)
  end
end

Then /^I should have ([0-9]+) course_events?$/ do |count|
  CourseEvent.count.should == count.to_i
end
