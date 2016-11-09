require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console.new }
  let(:robo) { subject.robo }
  let(:x) { 2 }
  let(:y) { 2 }

  describe 'runs LEFT' do
    context 'called before #place' do
      before do
        subject.run('left')
      end
      it 'no attr is assigned' do
        expect(robo.x).to be_falsey
        expect(robo.y).to be_falsey
        expect(robo.orientation).to be_falsey
      end
    end
    context 'called after #place and turns the Robo from' do
      it 'north => west' do
        subject.run("place #{x} #{y} north")
        subject.run('left')
        expect(robo.orientation).to eq :west
      end
      it 'west => south' do
        subject.run("place #{x} #{y} west")
        subject.run('left')
        expect(robo.orientation).to eq :south
      end
      it 'south => east' do
        subject.run("place #{x} #{y} south")
        subject.run('left')
        expect(robo.orientation).to eq :east
      end
      it 'east => north' do
        subject.run("place #{x} #{y} east")
        subject.run('left')
        expect(robo.orientation).to eq :north
      end
    end
  end
end
