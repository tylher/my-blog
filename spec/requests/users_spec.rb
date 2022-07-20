require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:each) { get users_path }
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end

    it 'render correct template' do
      expect(response).to render_template(:index)
    end

    it 'shows the right body in response' do
      expect(response.body).to include('Here is the list of users')
    end
  end

  describe 'a specification' do
    it 'render show template' do
      id = 1
      get "/users/#{id}"
      expect(response).to render_template(:show)
      expect(response.body).to include('Here is the profile of a given user')
    end
  end
end
