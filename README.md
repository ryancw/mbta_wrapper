# MbtaWrapper

[![Build Status](https://travis-ci.org/sicentendu/mbta_wrapper.png?branch=master)](https://travis-ci.org/sicentendu/mbta_wrapper)

Ruby MBTA API wrapper gem, nothing is really built yet but maybe it will be soon

## Installation

Add this line to your application's Gemfile:

    gem 'mbta_wrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mbta_wrapper

## Usage

This gem provides super easy access to the MBTA's API.

    MbtaWrapper::Subway # Built
    MbtaWrapper::CommuterRail # Not Built
    MbtaWrapper::Bus # Not Built

    MbtaWrapper::SubwayLine # Built
    MbtaWrapper::CommuterRailLine # Not Built
    MbtaWrapper::BusLine # Not Built
    
To view the current number of red line trains running:

    MbtaWrapper::SubwayLine.new('red').active_trains

To create an array of current trains on the red line:
  
    MbtaWrapper::SubwayLine.new('red').current_trains

## Contributing

TODO:
Implement CommuterRail and Bus (lines), create tests, think of more ways to supply data

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
