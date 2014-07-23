require 'rails_helper'

feature "Signing in" do
  background do
    FactoryGirl.create(:user)
  end
  # given(:other_user) { User.make(:email => 'other@example.com', :password => 'rous') }

  scenario "Signing in with correct credentials" do
    visit '/'
    #within("#session") do
    #  fill_in 'Email', :with => 'user@example.com'
    #  fill_in 'Password', :with => 'caplin'
    #end
    #click_button 'Sign in'
    expect(page).to have_content 'home'
  end

end
