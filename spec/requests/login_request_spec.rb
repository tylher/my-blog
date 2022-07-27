require 'rails_helper'

RSpec.describe 'Logins', type: :request do
  describe 'GET /form' do
    it 'returns http success' do
      get '/login'
      expect(response).to have_http_status(:success)
    end
  end
end
