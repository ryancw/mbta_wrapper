require "mbta_wrapper/version"
require "mbta_wrapper/subway_line"
require "mbta_wrapper/bus"
require "mbta_wrapper/commuterrail"
require "mbta_wrapper/subway"
require "mbta_wrapper/bus_line"
require "mbta_wrapper/commuterrail_line"
require 'json'
require 'net/http'
require 'rexml/document'

module MbtaWrapper

  def MbtaWrapper.orange_line
    MbtaWrapper::SubwayLine.new('orange')
  end

  def MbtaWrapper.blue_line
    MbtaWrapper::SubwayLine.new('blue')
  end

  def MbtaWrapper.red_line
    MbtaWrapper::SubwayLine.new('red')
  end
  
end
