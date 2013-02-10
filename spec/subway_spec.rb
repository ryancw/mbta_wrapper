require 'spec_helper'

describe MbtaWrapper::Subway do
  it 'should have working accessors' do
    t = create_red_line_train
    t.destination.should == 'Alewife'
    t.train_number.should == '1510'
    t.stops.class.should == Array
  end

  it 'should give the correct next stop' do
    t = create_red_line_train
    t.next_stop.should == {'Stop' => 'Quincy Adams', 'Seconds' => 237}
  end

  it 'should give the correct time to specified stop' do
    t = create_red_line_train
    t.time_to_stop_at('Quincy Adams').should == 237
  end

  def create_red_line_train
    red_line = MbtaWrapper::SubwayLine.new('red')
    red_line.stub!(:get_json).and_return(File.read('spec/sample_data/red.json'))
    red_line.current_trains[1]
  end
end