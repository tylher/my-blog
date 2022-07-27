# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logins', type: :request do
  describe 'GET /form' do
    it 'returns http success' do
<<<<<<< HEAD
      get '/login'
=======
      get '/login/form'
>>>>>>> 19f002a9f651fb5f5eb91dfad5cbf258953c860e
      expect(response).to have_http_status(:success)
    end
  end
end
