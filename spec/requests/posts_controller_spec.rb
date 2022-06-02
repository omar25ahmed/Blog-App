require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:each) do
      get '/users/:user_id/posts'
    end
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end
    it 'should render' do
      expect(response).to render_template('index')
    end
    it 'check text' do
      expect(response.body).to include('This the user posts')
    end
  end

  describe 'GET /users' do
    before(:each) do
      get '/users/:user_id/posts/:id'
    end
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end
    it 'should render' do
      expect(response).to render_template('show')
    end
    it 'check text' do
      expect(response.body).to include("Here is the post by it's id")
    end
  end
end
