require 'rails_helper'
require './spec/integrations_spec/integretion_mock.rb'

RSpec.describe 'login page', type: :system do
  include Mocks
  before(:each) do
    @users = create_users
    @posts = create_posts(@users)
  end

  context 'user index page' do
    it 'All user names are displayed' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'should show the profile picture for each user.' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      imgs = page.all('img')
      expect(imgs.length).to equal(@users.length)
    end

    it 'should show the number of posts each user has written.' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      users = User.all
      users.each do |user|
        expect(page).to have_content "number of posts: #{user.posts_counter}"
      end
    end

    it 'should redirected to that user\'s show page.' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      expect(page).to have_content 'Bio:'
    end
  end
end
