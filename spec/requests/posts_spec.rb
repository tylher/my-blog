require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/posts' do
    before(:each) { get user_posts_path(1) }
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should right placeholder in respons body' do
      expect(response.body).to include('This is the list of posts of a particular user')
    end
  end
end
