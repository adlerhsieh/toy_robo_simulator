require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console }
  before do
    stub_console_output
    @console = subject.new
    @robo    = @console.robo
  end
  describe 'REPORT' do
    it 'before #place' do
      expect { @console.run('report') }.not_to raise_error
    end
    it 'after #place' do
      @console.run('place 1 1 south')
      expect { @console.run('report') }.not_to raise_error
    end
  end
end
