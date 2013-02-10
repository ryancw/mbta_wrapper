require 'spec_helper'

describe MbtaWrapper::SubwayLine do
  it 'should return correct number of current trains' do
    red_line = MbtaWrapper::SubwayLine.new('red')
    red_line.stub!(:get_json).and_return(File.read('spec/sample_data/red.json'))
    red_line.active_trains.should == 10
  end
end