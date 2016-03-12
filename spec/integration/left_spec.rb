require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console }
  before { stub_console_output } 
  describe 'runs LEFT' do
    before do
      @console = subject.new
      @robo    = @console.robo
    end
    context 'called before #place' do
      before do
        @console.run('left')
      end
      it 'no attr is assigned' do
        expect(@robo.x).to be_falsey
        expect(@robo.y).to be_falsey
        expect(@robo.orientation).to be_falsey
      end
    end
    context 'called after #place and turns the Robo from' do
      let(:x) { 2 }
      let(:y) { 2 }
      it 'north => west' do
        @console.run("place #{x} #{y} north")
        @console.run('left')
        expect(@robo.orientation).to eq :west
      end
      it 'west => south' do
        @console.run("place #{x} #{y} west")
        @console.run('left')
        expect(@robo.orientation).to eq :south
      end
      it 'south => east' do
        @console.run("place #{x} #{y} south")
        @console.run('left')
        expect(@robo.orientation).to eq :east
      end
      it 'east => north' do
        @console.run("place #{x} #{y} east")
        @console.run('left')
        expect(@robo.orientation).to eq :north
      end
    end
  end
end
