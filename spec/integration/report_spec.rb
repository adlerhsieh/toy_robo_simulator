require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console.new }
  let(:robo) { subject.robo }

  before { stub_console_output }

  describe 'REPORT' do
    it 'before #place' do
      expect { subject.run('report') }.not_to raise_error
    end
    it 'after #place' do
      subject.run('place 1 1 south')
      expect { subject.run('report') }.not_to raise_error
    end
  end
end
