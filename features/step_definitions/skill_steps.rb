Given /^I have no skills$/ do
  Skill.delete_all
end

Given /^I (only )?have skills titled "?([^\"]*)"?$/ do |only, titles|
  Skill.delete_all if only
  titles.split(', ').each do |title|
    Skill.create(:name => title)
  end
end

Then /^I should have ([0-9]+) skills?$/ do |count|
  Skill.count.should == count.to_i
end
