Given(/^I am authenticated$/) do
  @user = FactoryGirl.create(:user)
  visit '/users/sign_in'
  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => @user.password
  click_button "Log in"
end

Given(/^I have a diary entry for today with "([^"]*)" narrative$/) do |narrative|
  @diary = FactoryGirl.create(:diary, narrative: narrative, user_id: @user.id)
end

When(/^I visit the homepage$/) do
  visit root_path
end

Then(/^I should see the "([^"]*)" diary entry$/) do |narrative|
  @diary = Diary.find_by_narrative(narrative)
  page.should have_content(@diary.narrative)
end
