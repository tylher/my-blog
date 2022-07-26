# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    user1 = User.new(id: 1, name: 'taiwo', posts_counter: 0)
    user1.save
    Post.create(id: 1, author: user1, title: 'hello', text: 'jkbnidbcuouewcuiguowece', likes_counter: 0,
                comments_counter: 0)
    Post.create(id: 2, author: user1, title: 'what you doing', text: 'jkbnidbcuouewcuiguowece', likes_counter: 0,
                comments_counter: 0)
    Post.create(id: 3, author: user1, title: 'amazing post', text: 'jkbnidbcuouewcuiguowece', likes_counter: 0,
                comments_counter: 0)
    Post.create(id: 4, author: user1, title: 'Hahahaha', text: 'jkbnidbcuouewcuiguowece', likes_counter: 0,
                comments_counter: 0)
  end
  describe 'GET /users/posts' do
    before(:each) { get user_posts_path(1) }
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should right placeholder in respons body' do
      expect(response.body).to include('likes:')
    end
  end

  describe 'GET Posts/show' do
    it 'render show template' do
      id = 1
      get "/users/1/posts/#{id}"
      expect(response).to render_template(:show)
      expect(response.body).to include('likes:')
    end
  end
end
