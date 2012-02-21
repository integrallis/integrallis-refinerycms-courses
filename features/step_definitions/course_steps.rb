Given /^I have no courses$/ do
  Course.delete_all
end

Given /^I (only )?have courses titled "?([^\"]*)"?$/ do |only, titles|
  Course.delete_all if only
  titles.split(', ').each do |title|
    Course.create(:title => title)
  end
end

Then /^I should have ([0-9]+) courses?$/ do |count|
  Course.count.should == count.to_i
end
