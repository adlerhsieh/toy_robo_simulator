require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console }
  before do
    stub_console_output
    @console = subject.new
    @robo    = @console.robo
  end
  describe 'PLACE' do
    context 'with no arg' do
      it 'is invalid' do
        @console.run('place')
        expect_no_attr_assigned_to_robo
      end
    end
    context 'with 1 arg' do
      it 'is invalid' do
        @console.run('place 2')
        expect_no_attr_assigned_to_robo
      end
    end
    context 'with 2 args' do
      it 'is invalid' do
        @console.run('place 2 3')
        expect_no_attr_assigned_to_robo
      end
    end
    context 'with 3 args' do
      it 'is invalid when x is not int' do
        @console.run('place n 1 south')
        expect_no_attr_assigned_to_robo
      end
      it 'is invalid when y is not int' do
        @console.run('place 1 n south')
        expect_no_attr_assigned_to_robo
      end
      it 'is invalid when orientation is not available' do
        @console.run('place 1 2 n')
        expect_no_attr_assigned_to_robo
      end
      it 'is valid' do
        @console.run('place 1 2 north')
        expect(@robo.x).to eq 1
        expect(@robo.y).to eq 2
        expect(@robo.orientation).to eq :north
      end
    end
  end
end
