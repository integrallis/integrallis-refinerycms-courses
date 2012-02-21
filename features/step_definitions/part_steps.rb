Given /^I have no parts$/ do
  Part.delete_all
end

Given /^I (only )?have parts titled "?([^\"]*)"?$/ do |only, titles|
  Part.delete_all if only
  titles.split(', ').each do |title|
    Part.create(:title => title)
  end
end

Then /^I should have ([0-9]+) parts?$/ do |count|
  Part.count.should == count.to_i
end
