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

    context 'with test data' do
      before :each do
        expect {
          Contractor.import_xml 'spec/fixtures/osha-compliance-100.xml'
        }.to change(Contractor, :count).by(100)
      end

      it 'returns "status: found" when passed a valid name' do
        get :check_fraud, :name => 'CARPET MASTERS'
        expect(JSON.parse response.body).to eq({'status' => 'non_compliant'})
      end
    end
  end

end
