Given /^I have no venues$/ do
  Venue.delete_all
end

Given /^I (only )?have venues titled "?([^\"]*)"?$/ do |only, titles|
  Venue.delete_all if only
  titles.split(', ').each do |title|
    Venue.create(:name => title)
  end
end

Then /^I should have ([0-9]+) venues?$/ do |count|
  Venue.count.should == count.to_i
end
