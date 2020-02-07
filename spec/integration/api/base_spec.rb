require 'rails_helper'

RSpec.describe Api::RatesController, type: :request do
  context 'GET /rates' do
    before { get '/api/rates' }

    it 'succeeds' do
      expect(response).to have_http_status 200
    end
  end

  context 'POST /refresh' do
    before { post '/api/refresh' }

    it 'returns response' do
      expect(response).to have_http_status 200
    end
  end
end
