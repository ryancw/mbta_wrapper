module MbtaWrapper
  class Bus
    def initialize(line)
      @line = line
    end

    def self.get_xml(command)
      resp = Net::HTTP.get_response(URI.parse("http://webservices.nextbus.com/service/publicXMLFeed?command=#{command}&a=mbta")).body
      data = REXML::Document.new(resp)
    end

    def self.all_lines
      line_names = []
      routes = Bus.get_xml('routeList')[2]
      routes.each do |title|
        line_names << title.text
      end
      line_names
    end
  end
end