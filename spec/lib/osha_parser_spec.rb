require 'osha_parser'

describe OshaParser do

  let(:fname) { 'spec/fixtures/osha-compliance-100.xml' }
  let(:parser) { OshaParser.new(fname) }

  it 'returns correct number of entries' do
    entries = parser.parse

    expect(entries.length).to eq(100)

    ent = entries.first
    expect(ent[:estab_name]).to eq("UNCLE BILL'S PANCAKE HOUSE")
    expect(ent[:site_address]).to eq('3425 S. KINGSHIGHWAY')
    expect(ent[:site_city]).to eq("ST. LOUIS")
    expect(ent[:site_state]).to eq('MO')
    expect(ent[:naics_code]).to eq('722110')
    expect(ent[:insp_type]).to eq("C")
    expect(ent[:open_date]).to eq(Time.parse '"2008-05-07T00:00:00"')
    expect(ent[:total_current_penalty]).to eq(0)
    expect(ent[:osha_violation_indicator]).to eq(false)
    expect(ent[:serious_violations]).to eq(0)
    expect(ent[:total_violations]).to eq(0)
    expect(ent[:load_dt]).to eq(Time.parse "2014-09-18T01:16:08.004584")
    
  end

end