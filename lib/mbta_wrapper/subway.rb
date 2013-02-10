module MbtaWrapper
  class Subway
    def initialize(line)
      @line = line
    end

    def get_and_parse_json
      resp = Net::HTTP.get_response(URI.parse("http://developer.mbta.com/lib/rthr/#{@line}.json"))
      data = JSON.parse(resp.body)
      ready = data['TripList']
    end

    # Number of current active trains
    def active_trains
      data = get_and_parse_json
      data['Trips'].length
    end

    # Time until next train at station
    def time_until(station)
      data = get_and_parse_json
      time = 0
      data['Trips'].each do |trip|
      end
    end

    # 
    def upcoming(number = 10)
      data = get_and_parse_json
      data['Trips'].each do |trip|
        first_prediction = trip['Predictions'].first
        stop = first_prediction['Stop']
        time = (sec = first_prediction['Seconds'].to_i) < 60 ? sec : (sec / 60).round
        if sec < 60
          puts "A #{@line} line train will arrive at #{stop} in #{time} seconds"
        else
          puts "A #{@line} line train will arrive at #{stop} in #{time} minutes"
        end
      end
    end

    def next_stops
    end
  end
end

