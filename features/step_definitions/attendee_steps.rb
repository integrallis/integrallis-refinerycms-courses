Given /^I have no attendees$/ do
  Attendee.delete_all
end

Given /^I (only )?have attendees titled "?([^\"]*)"?$/ do |only, titles|
  Attendee.delete_all if only
  titles.split(', ').each do |title|
    Attendee.create(:first_name => title)
  end
end

Then /^I should have ([0-9]+) attendees?$/ do |count|
  Attendee.count.should == count.to_i
end
