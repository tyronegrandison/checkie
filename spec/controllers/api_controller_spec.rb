require 'rails_helper'

RSpec.describe ApiController, :type => :controller do

  describe "GET check_fraud" do
    it "returns http success" do
      get :check_fraud
      expect(response).to have_http_status(:success)
    end

    it 'returns JSON body with "status" key' do
      get :check_fraud
      expect(JSON.parse response.body).to include('status')
    end
  end

end
