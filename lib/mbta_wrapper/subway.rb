module MbtaWrapper
  ##
  # This class represents an individual T (subway train)
  #
  # Train number is the ID number given by the MBTA \n
  # Destination is the end destination of the train \n
  # Stops is an array of hashes containing the stop name and seconds until it will be reached \n
  # Position is the last updated latitude and longitude coordinates of the train \n
  #
  # Subway should be generated from SubwayLine, it will constantly need to be regenerated to reflect current train status
  class Subway
    def initialize(train_number, destination, stops, position)
      @train_number = train_number
      @destination = destination
      @stops = stops
      @position = position
    end

    def train_number
      @train_number
    end

    def destination
      @destination
    end

    def stops
      @stops
    end

    def position
      @position
    end

    ##
    # Returns the next stop the train will make
    def next_stop
      stops.first
    end

    ##
    # Returns the time in seconds it will take the train to reach the given station
    def time_to_stop_at(station)
      stops.select {|stop| stop['Stop'] == station}.first['Seconds'] ||= nil
    end
  end
end

