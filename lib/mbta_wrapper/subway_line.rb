module MbtaWrapper
  class SubwayLine
    def initialize(line)
      @line = line
      @default_json_url = "http://developer.mbta.com/lib/rthr/" + @line.to_s.downcase + ".json"
    end

    def current_trains
      data = parse_json
      current_trains = []
      data['Trips'].each do |train|
        train_number = train['TrainNumber']
        destination = train['Destination']
        stops = []
        position = {'Latitude' => train['Latitude'], 'Longitude' => train['Longitude']}
        current_trains << Mbta::Subway.new(train_number, destination, stops, position)
      end
      current_trains
    end
    

    def get_json(url = @default_json_url)
      Net::HTTP.get_response(URI.parse(url)).body
    end

    def parse_json(url = @default_json_url)
      resp = get_json(url)
      data = JSON.parse(resp)
      ready = data['TripList']
    end

    # Number of current active trains
    def active_trains
      data = parse_json
      data['Trips'].length
    end

    # Time until next train at station
    def time_until(station)
      data = parse_json
      time = 0
      data['Trips'].each do |trip|
      end
    end

    # 
    def upcoming(number = 10)
      data = parse_json
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
