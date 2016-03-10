require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console }
  before do
    allow_any_instance_of(subject).to receive(:puts)
    allow_any_instance_of(subject).to receive(:print)
    allow_any_instance_of(ToyRoboSimulator::Robo).to receive(:puts)
    allow_any_instance_of(ToyRoboSimulator::Robo).to receive(:print)
  end
  describe 'runs' do
    before do
      @console = subject.new
      @robo    = @console.robo
    end
    describe 'PLACE' do
      it 'is valid with three args' do
        @console.run('place 1 2 north')
        expect(@robo.x).to eq 1
        expect(@robo.y).to eq 2
        expect(@robo.orientation).to eq :north
      end
      it 'is invalid with no args' do
        @console.run('place')
        expect(@robo.x).to be_falsey
        expect(@robo.y).to be_falsey
        expect(@robo.orientation).to be_falsey
      end
    end
  end
end
