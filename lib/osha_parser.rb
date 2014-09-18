require 'nokogiri'
require 'open-uri'

class OshaParser

  def initialize(url)
    @doc = Nokogiri::XML(open(url))
  end

  def parse
    entries = @doc.css("//entry")
    entries.map do |entry|

    end

    properties = @doc.xpath('//m:properties')
    properties.collect do |prop|
      {
          estab_name: prop.xpath('d:estab_name').text,
          site_city: prop.xpath('d:site_city').text,
          site_state: prop.xpath('d:site_state').text,
          osha_violation_indicator: 'true' == prop.xpath('d:osha_violation_indicator').text,
          site_address:  prop.xpath('d:site_address').text,
          naics_code: prop.xpath('d:naics_code').text,
          insp_type: prop.xpath('d:insp_type:').text,
          open_date: prop.xpath('d:open_date').text,
          total_current_penalty: prop.xpath('d:total_current_penalty').text,
          us_violations: prop.xpath('d:us_violations').text,
          total_violations: prop.xpath('d:total_violations').text,
          load_dt: prop.xpath('d:load_dt').text,
      }
    end
  end

end