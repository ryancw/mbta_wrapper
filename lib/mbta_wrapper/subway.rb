module MbtaWrapper
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

    def next_stop
      stops.first
    end

    def time_to_stop_at(station)
      stops.select {|stop| stop['Stop'] == station}.first['Seconds']
    end
  end
end

