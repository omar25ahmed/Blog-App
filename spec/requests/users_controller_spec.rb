require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:each) do
      get '/users'
    end
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end
    it 'should render' do
      expect(response).to render_template('index')
    end
    it 'check text' do
      expect(response.body).to include('Users')
    end
  end

  describe 'GET /users' do
    before(:each) do
      get '/users/:id'
    end
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end
    it 'should render' do
      expect(response).to render_template('show')
    end
    it 'check text' do
      expect(response.body).to include('The User Profile Appear here')
    end
  end
end
