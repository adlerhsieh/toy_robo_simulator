require 'spec_helper'
require 'ostruct'

describe ToyRoboSimulator::Console do
  subject { ToyRoboSimulator::Console }
  before do
    allow_any_instance_of(subject).to receive(:puts)
    allow_any_instance_of(subject).to receive(:print)
  end
  it '#run' do
    subject.instance_variable_set(:@robo, OpenStruct.new(place: nil))
    expect { subject.new.run('exit') }.to raise_error SystemExit
    expect { subject.new.run('help') }.not_to raise_error
    expect { subject.new.run('place') }.not_to raise_error
    expect { subject.new.run('unknown') }.not_to raise_error
  end
end
