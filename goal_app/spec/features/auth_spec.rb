require 'spec_helper'
require 'rails_helper'


feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('Sign Up')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      sign_up_steve

      expect(page).to have_content('homepage')
      expect(page).to have_content('steve')
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    sign_up_steve
    log_in_steve
    expect(page).to have_content('homepage')
    expect(page).to have_content('steve')
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit goals_url
    expect(page).to_not have_button("Log Out")
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    sign_up_steve
    log_in_steve
    click_button("Log Out")
    expect(page).to_not have_content("steve")
  end

end
