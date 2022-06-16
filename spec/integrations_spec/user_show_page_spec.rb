require 'rails_helper'
require './spec/integrations_spec/integretion_mock.rb'

RSpec.describe 'login page', type: :system do
  include Mocks
  before(:each) do
    @users = create_users
    @posts = create_posts(@users)
  end

  context 'user index page' do
    it 'should show user image' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      imgs = page.all('img')
      expect(imgs.length).to equal(1)
    end

    it 'it should show user name' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      expect(page).to have_content(@users.first.name)
    end

    it 'it should show posts counter' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      expect(page).to have_content "number of posts: 10"
    end

    it 'it should show user bio' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      expect(page).to have_content "Bio:"
    end

    it 'it should show user bio' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      expect(page).to have_content "See all posts"
    end

    it 'it should redirects me to that post\'s show page' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link "See all posts"
      expect(page).to have_content "Add new Post"
    end
  end
end
