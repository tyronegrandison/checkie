require 'osha_parser'

describe OshaParser do

  let(:fname) { 'spec/fixtures/osha-compliance-100.xml' }
  let(:parser) { OshaParser.new(fname) }

  it 'returns correct number of entries' do
    entries = parser.parse

    expect(entries.length).to eq(100)

    bill = entries.first
    expect(bill[:estab_name]).to eq("UNCLE BILL'S PANCAKE HOUSE")
    expect(bill[:site_address]).to eq('3425 S. KINGSHIGHWAY')
    expect(bill[:site_city]).to eq("ST. LOUIS")
    expect(bill[:site_state]).to eq('MO')
    expect(bill[:site_zip]).to eq('63139')
    expect(bill[:naics_code]).to eq('722110')
    expect(bill[:insp_type]).to eq("C")
    expect(bill[:open_date]).to eq(Time.parse '"2008-05-07T00:00:00"')
    expect(bill[:total_current_penalty]).to eq(0)
    expect(bill[:osha_violation_indicator]).to eq(false)
    expect(bill[:serious_violations]).to eq(0)
    expect(bill[:total_violations]).to eq(0)
    expect(bill[:load_dt]).to eq(Time.parse "2014-09-18T01:16:08.004584")

    carpet_master = entries[2]
    expect(carpet_master[:estab_name]).to eq('CARPET MASTERS')
    expect(carpet_master[:serious_violations]).to eq(8)
    expect(carpet_master[:total_violations]).to eq(1)
    expect(carpet_master[:total_current_penalty]).to eq(2295)
  end

end