require 'rails_helper'

describe Contractor do

  context ".import_xml" do
    it 'increases Contractor table count by 100' do
      expect {
        Contractor.import_xml('spec/fixtures/osha-compliance-100.xml')
      }.to change(Contractor, :count).by(100)
    end
  end

end