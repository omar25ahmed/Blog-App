require 'rails_helper'

RSpec.describe 'login page', type: :system do
  before(:each) do
    user = User.create(name: 'Omar ragheb', posts_counter: 0, email: 'ahmed.raph29@gmail.com')
    user.password = '123456'
    user.password_confirmation = '123456'
    user.skip_confirmation!
    user.save!
  end
  context 'login page' do
    it 'login page renders properly' do
      visit new_user_session_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Log in')
    end

    it 'testing the validation of login page ' do
      visit new_user_session_path
      click_button('Log in');
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'testing the validation of login page ' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: 'mateovills324agomez1995@gmail.com'
        fill_in 'user_password', with: '123sfd456'
      end
      click_button('Log in');
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'testing the validation of login page ' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: 'ahmed.raph29@gmail.com'
        fill_in 'user_password', with: '123456'
      end
      click_button('Log in');
      expect(page).to have_content('Logged in as ahmed.raph29@gmail.com')
    end
  end
end
