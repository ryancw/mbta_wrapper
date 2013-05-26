module MbtaWrapper
  class CommuterRail
    def initialize(line)
      @line_name = line
      @line = COMMUTER_RAIL_LINES[line.to_s]
      if @line.nil?
        puts 'Error: line name incorrect'
      end
    end

    COMMUTER_RAIL_LINES = {%r{greenbush}i => '1', %r{kingston|plymouth}i => '2', %r{middleborough|lakeville}i => '3',
                          %r{lakeville}i => '3', %r{fairmount}i => '4', %r{providence|stoughton}i => '5',
                          %r{franklin}i => '6', %r{needham}i => '7', %r{framingham|worcester}i => '8',
                           %r{fitchburg}i => '9', %r{lowell}i => '10',
                          %r{haverhill}i => '11', %r{newburyport|rockport}i => '2'}

    COMMUTER_RAIL_JSON_URL = 'http://developer.mbta.com/lib/RTCR/RailLine_'

    def get_and_parse_json(line)
      resp = Net::HTTP.get_response(URI.parse(COMMUTER_RAIL_JSON_URL + line.to_s + ".json"))
      data = JSON.parse(resp.body)
    end

    # Total active trains in all lines
    def self.total_active_trains
      total = 0
      for i in 1..12
        data = get_and_parse_json
        total += data['Trips'].length
      end
      total
    end

    def self.current_location_all_trains
      locations = []
      for i in 1..12
        resp = Net::HTTP.get_response(URI.parse(COMMUTER_RAIL_JSON_URL + i.to_s + ".json"))
        data = JSON.parse(resp.body)
        data['Messages'].each do |trip|
          locations << [trip[7]['Value'], trip[8]['Value']]
        end
      end
      locations
    end

    # Active train for given lines
    def active_trains
    end
  end
end
