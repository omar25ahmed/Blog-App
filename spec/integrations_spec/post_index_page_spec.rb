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
    it 'should show user image' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'
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
      click_link 'See all posts'
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
      click_link 'See all posts'
      expect(page).to have_content 'number of posts: 10'
    end

    it 'it should show posts title' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'

      @users.first.posts.each do |post|
        expect(page).to have_content post.title
      end
    end

    it 'it should show most recent comments' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'

      @users.first.most_recent_posts do |comment|
        expect(page).to have_content comment.text
      end
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
      expect(page).to have_content "Likes: #{@post.likes_counter}"
    end

    it 'it should redirects to post show' do
      visit new_user_session_path

      within('form') do
        fill_in 'user_email', with: 'foo1@foo.com'
        fill_in 'user_password', with: 'admin123'
      end
      click_button 'Log in'
      click_link 'Mateo'
      click_link 'See all posts'
      click_link @post.title
      post = @users[0].most_recent_posts[0]
      expect(page).to have_current_path "/users/#{@users[0].id}/posts/#{post.id}"
    end
  end
end
