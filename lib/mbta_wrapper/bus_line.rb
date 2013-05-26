module MbtaWrapper
  ##
  # This class represents an MBTA bus line
  #
  # It is initialized with the name of the line
  class BusLine
    def initialize(line)
      @line = line
    end

    def line
      @line
    end

    def self.get_xml(command, route = nil)
      if route
        resp = Net::HTTP.get_response(URI.parse("http://webservices.nextbus.com/service/publicXMLFeed?command=#{command}&a=mbta&r=#{route}")).body
      else
        resp = Net::HTTP.get_response(URI.parse("http://webservices.nextbus.com/service/publicXMLFeed?command=#{command}&a=mbta")).body
      end
      REXML::Document.new(resp)
    end

    def self.all_lines
      line_names = []
      routes = MbtaWrapper::BusLine.get_xml('routeList')
      routes.elements.each('*/route') do |title|
        line_names << title.attributes['title']
      end
      line_names
    end

    ##
    # Display inbound or outbound route for Bus
    def route_config(direction)
      stops_xml = MbtaWrapper::BusLine.get_xml('routeConfig', line.to_i)
      stops = []
      stops_xml.elements.each('body/route/stop') do |stop|
        stops << stop.attributes['title']
      end
      stops
    end
  end
end
