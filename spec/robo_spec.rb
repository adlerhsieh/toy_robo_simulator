require 'spec_helper'

describe ToyRoboSimulator::Robo do
  subject { ToyRoboSimulator::Robo.new }
  before do
    allow(subject).to receive(:puts)
    allow(subject).to receive(:print)
  end

  describe '#place' do
    context 'coordinates out of range' do
      let(:x)           { 6 }
      let(:y)           { 6 }
      let(:orientation) { :north }
      before do
        subject.place(x, y, orientation)
      end
      it 'no attr is assigned' do
        expect(subject.x).to be_falsey
        expect(subject.y).to be_falsey
        expect(subject.orientation).to be_falsey
      end
    end
    context 'successfully' do
      let(:x)           { 5 }
      let(:y)           { 5 }
      let(:orientation) { :north }
      before do
        subject.place(x, y, orientation)
      end
      it 'assigns attrs' do
        expect(subject.x).to eq x
        expect(subject.y).to eq y
        expect(subject.orientation).to eq orientation
      end
    end
  end

  describe '#move' do
    context 'called before #place' do
      before do
        subject.move
      end
      it 'no attr is assigned' do
        expect(subject.x).to be_falsey
        expect(subject.y).to be_falsey
        expect(subject.orientation).to be_falsey
      end
    end
    context 'called after #place' do
      context 'out of range' do
        let(:x)           { 5 }
        let(:y)           { 5 }
        let(:orientation) { :north }
        before do
          subject.place(x, y, orientation)
          subject.move
        end
        it 'does not move' do
          expect(subject.x).to eq(x)
          expect(subject.y).to eq(y)
          expect(subject.orientation).to eq orientation
        end
      end
      context 'within range' do
        let(:x) { 1 }
        let(:y) { 1 }
        context 'and the robo facing north' do
          let(:orientation) { :north }
          before do
            subject.place(x, y, orientation)
            subject.move
          end
          it 'moves robo 1 space towards north' do
            expect(subject.x).to eq(x)
            expect(subject.y).to eq(y + 1)
            expect(subject.orientation).to eq orientation
          end
        end
        context 'and the robo facing west' do
          let(:orientation) { :west }
          before do
            subject.place(x, y, orientation)
            subject.move
          end
          it 'moves robo 1 space towards west' do
            expect(subject.x).to eq(x - 1)
            expect(subject.y).to eq(y)
            expect(subject.orientation).to eq orientation
          end
        end
        context 'and the robo facing south' do
          let(:orientation) { :south }
          before do
            subject.place(x, y, orientation)
            subject.move
          end
          it 'moves robo 1 space towards south' do
            expect(subject.x).to eq(x)
            expect(subject.y).to eq(y - 1)
            expect(subject.orientation).to eq orientation
          end
        end
        context 'and the robo facing east' do
          let(:orientation) { :east }
          before do
            subject.place(x, y, orientation)
            subject.move
          end
          it 'moves robo 1 space towards east' do
            expect(subject.x).to eq(x + 1)
            expect(subject.y).to eq(y)
            expect(subject.orientation).to eq orientation
          end
        end
      end
    end
  end

  describe '#left' do
    context 'called before #place' do
      before do
        subject.left
      end
      it 'no attr is assigned' do
        expect(subject.x).to be_falsey
        expect(subject.y).to be_falsey
        expect(subject.orientation).to be_falsey
      end
    end
    context 'called after #place and turns the Robo from' do
      let(:x)           { 2 }
      let(:y)           { 2 }
      it 'north => west' do
        subject.place(x, y, :north)
        subject.left
        expect(subject.orientation).to eq :west
      end
      it 'west => south' do
        subject.place(x, y, :west)
        subject.left
        expect(subject.orientation).to eq :south
      end
      it 'south => east' do
        subject.place(x, y, :south)
        subject.left
        expect(subject.orientation).to eq :east
      end
      it 'east => north' do
        subject.place(x, y, :east)
        subject.left
        expect(subject.orientation).to eq :north
      end
    end
  end

  describe '#right' do
    context 'called before #place' do
      before do
        subject.right
      end
      it 'no attr is assigned' do
        expect(subject.x).to be_falsey
        expect(subject.y).to be_falsey
        expect(subject.orientation).to be_falsey
      end
    end
    context 'called after #place and turns the Robo from' do
      let(:x)           { 2 }
      let(:y)           { 2 }
      it 'north => east' do
        subject.place(x, y, :north)
        subject.right
        expect(subject.orientation).to eq :east
      end
      it 'east => south' do
        subject.place(x, y, :east)
        subject.right
        expect(subject.orientation).to eq :south
      end
      it 'south => west' do
        subject.place(x, y, :south)
        subject.right
        expect(subject.orientation).to eq :west
      end
      it 'west => north' do
        subject.place(x, y, :west)
        subject.right
        expect(subject.orientation).to eq :north
      end
    end
  end

  describe '#report' do
    let(:x){ 2 }
    let(:y){ 2 }
    it 'before #place' do
      expect { subject.report }.not_to raise_error
    end
    it 'after #place' do
      subject.place(x, y, :north)
      expect { subject.report }.not_to raise_error
    end
  end
end
