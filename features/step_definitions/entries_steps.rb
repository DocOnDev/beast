Given(/^there are (\d+) entries$/) do |entry_count|
  created_entries = FactoryGirl.create_list(:entry, entry_count.to_i)
end

Then(/^I should see a list of (\d+) entries$/) do |entry_count|
  page.should have_css("table tbody tr", :count=>(entry_count.to_i))
end
