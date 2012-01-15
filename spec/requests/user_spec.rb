require File.dirname(__FILE__) + '/../spec_helper'

feature "A Visitor" do
  background do
    @user       = Factory(:user)
    @user_count = User.count
    visit "/"
  end
  
  scenario "should be able to register" do
    click_link "Register"
    fill_in "Name", :with => "Visitor"
    fill_in "Email", :with => "visitor@example.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    page.should have_content("visitor@example.com")
    page.should have_content("Welcome! You have signed up successfully.")
    click_link "Sign out"
    page.should have_content("Signed out successfully.")
    User.count.should eq(@user_count + 1)
  end

  scenario "should not be logged in" do
    page.should have_content("Register")
    page.should have_css("a[href='/users/sign_up']")
    page.should have_content("Sign in")
    page.should have_css("a[href='/users/sign_in']")
  end
  
  scenario "should be able to retreive password" do
    click_link "Register"
    click_link "Forgot your password?"
    fill_in "Email", :with => @user.email
    click_button "Send me reset password instructions"
    page.should have_content("You will receive an email with instructions about how to reset your password in a few minutes.")
  end
end

feature "A User" do
  background do
    @user       = Factory(:user)

    login_as(@user.email)
  end
  
  scenario "should be able to login" do
    page.should have_content("Signed in successfully.")
    page.should have_content("mikecowden@example.com")
    page.should have_content("Welcome Back!")    
  end
  
  scenario "should be able to logout" do
    click_link "Sign out"
    page.should have_content("Signed out successfully.")
  end
  
  scenario "should be able to update account info" do
    click_link "Settings"
    fill_in "Name", :with => "Bogus"
    fill_in "Current password", :with => "password"
    click_button "Update"
    page.should have_content("You updated your account successfully")
    @user.reload.name.should eq("Bogus")
  end

  scenario "should be able to view profile" do
    click_link @user.email
    page.should have_content(@user.name)
  end
end