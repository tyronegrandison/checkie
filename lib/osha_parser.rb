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
      }
    end
  end

end