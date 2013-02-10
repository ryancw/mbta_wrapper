module MbtaWrapper
  class BusLine
    def initialize(line)
      @line = line
    end

    def line
      @line
    end

    def self.get_xml(command)
      resp = Net::HTTP.get_response(URI.parse("http://webservices.nextbus.com/service/publicXMLFeed?command=#{command}&a=mbta")).body
      data = REXML::Document.new(resp)
    end

    def self.all_lines
      line_names = []
      routes = MbtaWrapper::BusLine.get_xml('routeList')
      routes.elements.each('*/route') do |title|
        line_names << title.attributes['title']
      end
      line_names
    end
  end
end