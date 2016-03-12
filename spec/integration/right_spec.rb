require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console }
  before { stub_console_output } 
  describe 'runs RIGHT' do
    before do
      @console = subject.new
      @robo    = @console.robo
    end
    context 'called before #place' do
      before do
        @console.run('right')
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
      it 'north => east' do
        @console.run("place #{x} #{y} north")
        @console.run('right')
        expect(@robo.orientation).to eq :east
      end
      it 'west => north' do
        @console.run("place #{x} #{y} west")
        @console.run('right')
        expect(@robo.orientation).to eq :north
      end
      it 'south => west' do
        @console.run("place #{x} #{y} south")
        @console.run('right')
        expect(@robo.orientation).to eq :west
      end
      it 'east => south' do
        @console.run("place #{x} #{y} east")
        @console.run('right')
        expect(@robo.orientation).to eq :south
      end
    end
  end
end
