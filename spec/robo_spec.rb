require 'spec_helper'

describe ToyRoboSimulator::Robo do
  before do
    @robo = ToyRoboSimulator::Robo.new
  end

  describe "#place" do
    context "coordinates out of range" do
      let(:x)           { 6 }
      let(:y)           { 6 }
      let(:orientation) { :north }
      before do
        @robo.place(x, y, orientation) 
      end
      it 'no attr is assigned' do
        expect(@robo.x).to           be_falsey
        expect(@robo.y).to           be_falsey
        expect(@robo.orientation).to be_falsey
      end
    end
    context "successfully" do
      let(:x)           { 5 }
      let(:y)           { 5 }
      let(:orientation) { :north }
      before do
        @robo.place(x, y, orientation) 
      end
      it 'assigns attrs' do
        expect(@robo.x).to           eq x
        expect(@robo.y).to           eq y
        expect(@robo.orientation).to eq orientation
      end
    end
  end

  describe "#move" do
    context "called before #place" do
      before do
        @robo.move
      end
      it 'no attr is assigned' do
        expect(@robo.x).to           be_falsey
        expect(@robo.y).to           be_falsey
        expect(@robo.orientation).to be_falsey
      end
    end
    context "called after #place" do
      context "out of range" do
        let(:x)           { 5 }
        let(:y)           { 5 }
        let(:orientation) { :north }
        before do
          @robo.place(x, y, orientation) 
          @robo.move
        end
        it 'does not move' do
          expect(@robo.x).to eq(x)
          expect(@robo.y).to eq(y)
          expect(@robo.orientation).to eq orientation
        end
      end
      context "within range" do
        let(:x) { 1 }
        let(:y) { 1 }
        context "and the robo facing north" do
          let(:orientation) { :north }
          before do
            @robo.place(x, y, orientation) 
            @robo.move
          end
          it 'moves robo 1 space towards north' do
            expect(@robo.x).to eq(x)
            expect(@robo.y).to eq(y + 1)
            expect(@robo.orientation).to eq orientation
          end
        end
        context "and the robo facing east" do
          let(:orientation) { :east }
          before do
            @robo.place(x, y, :east) 
            @robo.move
          end
          it 'moves robo 1 space towards east' do
            expect(@robo.x).to eq(x + 1)
            expect(@robo.y).to eq(y)
            expect(@robo.orientation).to eq orientation
          end
        end
      end
    end
  end

  describe "#left" do
    context 'called before #place' do
      before do
        @robo.left
      end
      it 'no attr is assigned' do
        expect(@robo.x).to           be_falsey
        expect(@robo.y).to           be_falsey
        expect(@robo.orientation).to be_falsey
      end
    end
    context 'called after #place and turns the Robo from' do
      let(:x)           { 2 }
      let(:y)           { 2 }
      it 'north => west' do
        @robo.place(x, y, :north) 
        @robo.left
        expect(@robo.orientation).to eq :west
      end
      it 'west => south' do
        @robo.place(x, y, :west) 
        @robo.left
        expect(@robo.orientation).to eq :south
      end
      it 'south => east' do
        @robo.place(x, y, :south) 
        @robo.left
        expect(@robo.orientation).to eq :east
      end
      it 'east => north' do
        @robo.place(x, y, :east) 
        @robo.left
        expect(@robo.orientation).to eq :north
      end
    end
  end

  describe "#right" do
    context 'called before #place' do
      before do
        @robo.right
      end
      it 'no attr is assigned' do
        expect(@robo.x).to           be_falsey
        expect(@robo.y).to           be_falsey
        expect(@robo.orientation).to be_falsey
      end
    end
    context 'called after #place and turns the Robo from' do
      let(:x)           { 2 }
      let(:y)           { 2 }
      it 'north => east' do
        @robo.place(x, y, :north) 
        @robo.right
        expect(@robo.orientation).to eq :east
      end
      it 'east => south' do
        @robo.place(x, y, :east) 
        @robo.right
        expect(@robo.orientation).to eq :south
      end
      it 'south => west' do
        @robo.place(x, y, :south) 
        @robo.right
        expect(@robo.orientation).to eq :west
      end
      it 'west => north' do
        @robo.place(x, y, :west) 
        @robo.right
        expect(@robo.orientation).to eq :north
      end
    end
  end

  describe "#report" do
    it 'works' do
      expect{ @robo.report }.not_to raise_error
    end
  end
end
