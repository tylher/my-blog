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
<<<<<<< HEAD
      expect(response.body).to include('likes:')
=======
      expect(response.body).to include('This is the list of posts of a particular user')
>>>>>>> 19f002a9f651fb5f5eb91dfad5cbf258953c860e
    end
  end

  describe 'GET Posts/show' do
    it 'render show template' do
      id = 1
      get "/users/1/posts/#{id}"
      expect(response).to render_template(:show)
<<<<<<< HEAD
      expect(response.body).to include('likes:')
=======
      expect(response.body).to include('his is a particular post of a user')
>>>>>>> 19f002a9f651fb5f5eb91dfad5cbf258953c860e
    end
  end
end
