require 'osha_parser'

describe OshaParser do

  let(:fname) { 'spec/fixtures/osha-compliance-100.xml' }
  let(:parser) { OshaParser.new(fname) }

  it 'returns correct number of entries' do
    entries = parser.parse

    expect(entries.length).to eq(100)

    ent = entries.first
    expect(ent[:estab_name]).to eq("UNCLE BILL'S PANCAKE HOUSE")
    expect(ent[:site_city]).to eq("ST. LOUIS")
    expect(ent[:site_state]).to eq('MO')
    expect(ent[:osha_violation_indicator]).to eq(false)
  end

end