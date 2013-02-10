require 'spec_helper'

describe MbtaWrapper::SubwayLine do
  it 'should return correct number of current trains' do
    red_line = create_red_line
    red_line.active_trains.should == 10
  end

  it 'should create an array of Subways' do
    red_line = create_red_line
    red_line.current_trains.first.class.should == MbtaWrapper::Subway
  end

  def create_red_line
    red_line = MbtaWrapper::SubwayLine.new('red')
    red_line.stub!(:get_json).and_return(File.read('spec/sample_data/red.json'))
    red_line
  end
end