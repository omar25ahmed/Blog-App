require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:each) do
      user = User.first
      get "/users/#{user.id}/posts"
    end
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end
    it 'should render' do
      expect(response).to render_template('index')
    end
    it 'check text' do
      expect(response.body).to include('number of posts:')
    end
  end

  describe 'GET /users' do
    before(:each) do
      user = User.first
      post = user.posts.create(title: 'Post Title', text: 'This is the post text')
      get "/users/#{user.id}/posts/#{post.id}"
      puts post
    end
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end
    it 'should render' do
      expect(response).to render_template('show')
    end
    it 'check text' do
      expect(response.body).to include("comments:")
    end
  end
end
