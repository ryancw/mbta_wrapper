module MbtaWrapper
  class CommuterRail
    def initialize(line)
      @line_name = line
      @line = COMMUTER_RAIL_LINES[line.to_s]
      if @line.nil?
        puts 'Error: line name incorrect'
      end
    end

    COMMUTER_RAIL_LINES = {'Greenbush' => '1', 'Kingston' => '2', 'Kingston/Plymouth' => '2', 'Plymouth' => '2', 'Middleborough/Lakeville' => '3', 'Middleborough' => '3', 'Lakeville' => '3', 'Fairmount' => '4', 'Providence/Stoughton' => '5', 'Providence' => '5', 'Stoughton' => '5', 'Franklin' => '6', 'Needham' => '7', 'Framingham/Worcester' => '8', 'Framingham' => '8', 'Worcester' => '8', 'Fitchburg' => '9', 'Lowell' => '10', 'Haverhill' => '11', 'Newburyport/Rockport' => '2', 'Newburyport' => '2', 'Rockport' => '2'}

    COMMUTER_RAIL_JSON_URL = "http://developer.mbta.com/lib/RTCR/RailLine_"

    def get_and_parse_json
      resp = Net::HTTP.get_response(URI.parse("http://developer.mbta.com/lib/RTCR/RailLine_#{@line}.json"))
      data = JSON.parse(resp.body)
    end

    # Total active trains in all lines
    def self.total_active_trains
      total = 0
      for i in 1..12
        resp = Net::HTTP.get_response(URI.parse(COMMUTER_RAIL_JSON_URL + i.to_s + ".json"))
        data = JSON.parse(resp.body)
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