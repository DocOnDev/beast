Given(/^I am authenticated$/) do
  if !@user
    @user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => @user.password
    click_button "Log in"
  end
end

Given(/^I am not authenticated$/) do
  visit '/users/sign_out'
end
