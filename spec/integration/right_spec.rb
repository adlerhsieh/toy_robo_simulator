require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console.new }
  let(:robo) { subject.robo }
  let(:x) { 2 }
  let(:y) { 2 }

  before { stub_console_output }

  describe 'runs RIGHT' do
    context 'called before #place' do
      before do
        subject.run('right')
      end
      it 'no attr is assigned' do
        expect(robo.x).to be_falsey
        expect(robo.y).to be_falsey
        expect(robo.orientation).to be_falsey
      end
    end
    context 'called after #place and turns the Robo from' do
      it 'north => east' do
        subject.run("place #{x} #{y} north")
        subject.run('right')
        expect(robo.orientation).to eq :east
      end
      it 'west => north' do
        subject.run("place #{x} #{y} west")
        subject.run('right')
        expect(robo.orientation).to eq :north
      end
      it 'south => west' do
        subject.run("place #{x} #{y} south")
        subject.run('right')
        expect(robo.orientation).to eq :west
      end
      it 'east => south' do
        subject.run("place #{x} #{y} east")
        subject.run('right')
        expect(robo.orientation).to eq :south
      end
    end
  end
end
