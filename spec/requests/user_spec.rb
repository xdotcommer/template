require File.dirname(__FILE__) + '/../spec_helper'

feature "A Visitor" do
  background do
    @user_count = User.count
    visit "/"
  end
  
  scenario "should be able to signup" do
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
end

feature "A User" do
  background do
    @user       = Factory(:user)

    login_as(@user.email)
  end
  
  scenario "should be able to login" do
    page.should have_content("Signed in successfully.")
    page.should have_content("mikecowden@example.com")
  end
  
  scenario "should be able to logout" do
    click_link "Sign out"
    page.should have_content("Signed out successfully.")
  end
  
  scenario "should be able to retreive password" do
    click_link "Sign out"
    visit "/users/password/new"
    fill_in "Email", :with => @user.email
    click_button "Send me reset password instructions"
    page.should have_content("You will receive an email with instructions about how to reset your password in a few minutes.")
  end
end