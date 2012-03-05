Given /^I have no instructors$/ do
  Instructor.delete_all
end

Given /^I (only )?have instructors titled "?([^\"]*)"?$/ do |only, titles|
  Instructor.delete_all if only
  titles.split(', ').each do |title|
    Instructor.create(:first_name => title)
  end
end

Then /^I should have ([0-9]+) instructors?$/ do |count|
  Instructor.count.should == count.to_i
end
