require 'osha_parser'

class Contractor < ActiveRecord::Base

  def self.import_xml(fname)
    parser = OshaParser.new(fname)
    entries = parser.parse
    entries.each do |entry|
      Contractor.create!(
          name: entry[:estab_name],
          site_city: entry[:site_city],
          site_state: entry[:site_state],
          site_zip: entry[:site_zip],
          osha_violation_indicator: entry[:osha_violation_indicator],
          site_address: entry[:site_address],
          naics_code: entry[:naics_code],
          insp_type: entry[:insp_type],
          open_date: entry[:open_date],
          total_current_penalty: entry[:total_current_penalty],
          serious_violations: entry[:serious_violations],
          total_violations: entry[:total_violations],
          loaded_at: entry[:load_dt],
      )
    end
  end

end
