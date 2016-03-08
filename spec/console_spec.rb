require 'spec_helper'
require 'ostruct'

describe ToyRoboSimulator::Console do
  subject { ToyRoboSimulator::Console }
  before do
    allow(subject).to receive(:puts)
    allow(subject).to receive(:print)
  end
  it '.run' do
    subject.instance_variable_set(:@robo, OpenStruct.new(place: nil))
    expect{subject.run('exit')}.to        raise_error SystemExit
    expect{subject.run('help')}.not_to    raise_error
    expect{subject.run('place')}.not_to   raise_error
    expect{subject.run('unknown')}.not_to raise_error
  end
end
