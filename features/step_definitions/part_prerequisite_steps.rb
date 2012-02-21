Given /^I have no part_prerequisites$/ do
  PartPrerequisite.delete_all
end

Given /^I (only )?have part_prerequisites titled "?([^\"]*)"?$/ do |only, titles|
  PartPrerequisite.delete_all if only
  titles.split(', ').each do |title|
    PartPrerequisite.create(:reason => title)
  end
end

Then /^I should have ([0-9]+) part_prerequisites?$/ do |count|
  PartPrerequisite.count.should == count.to_i
end
