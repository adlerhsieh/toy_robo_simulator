require 'spec_helper'

describe ToyRoboSimulator::Robo do
  before do
    @robo = ToyRoboSimulator::Robo.new
  end
  describe "#initialize" do
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
      it 'has error' do
        expect(@robo.errors.size).to be > 0
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
      it 'has error' do
        expect(@robo.errors.size).to be > 0
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
        it 'has error' do
          expect(@robo.errors.size).to be > 0
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

  end

  describe "#right" do

  end

  describe "#report" do

  end
end
