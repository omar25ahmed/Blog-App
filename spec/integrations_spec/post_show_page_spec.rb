require 'rails_helper'
require './spec/integrations_spec/integretion_mock'
RSpec.describe 'login page', type: :system do
  include Mocks
  before(:each) do
    @users = create_users
    @posts = create_posts(@users)
    create_likes_comments(@users, @posts)
    @post = @users[0].most_recent_posts[0]
  end
  context 'post index page' do
    it 'it should have the post title' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'
      click_link @post.title
      expect(page).to have_content(@post.title)
    end
    it 'it should have the author name' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'
      click_link @post.title
      expect(page).to have_content(@users.first.name)
    end
    it 'it should show comments number' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'
      click_link @post.title
      expect(page).to have_content "comments: #{@post.comments_counter}"
    end
    it 'it should show likes number' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'
      click_link @post.title
      expect(page).to have_content "Likes: #{@post.likes_counter}"
    end
    it 'it should show post body' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'
      click_link @post.title
      expect(page).to have_content(@post.text)
    end
  end
end
