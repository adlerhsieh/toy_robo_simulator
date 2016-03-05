require 'spec_helper'

describe ToyRoboSimulator::Robo do
  before do
    @robot = ToyRoboSimulator::Robo.new
  end
  describe "#initialize" do
    context "position out of range" do
      let(:x)           { 6 }
      let(:y)           { 6 }
      let(:orientation) { :north }
      before do
        @robot.place(x, y, orientation) 
      end
      it 'no attr is assigned' do
        expect(@robot.x).to           be_falsey
        expect(@robot.y).to           be_falsey
        expect(@robot.orientation).to be_falsey
      end
      it 'displays error messages' do
        expect(@robot.errors.size).to be > 0
      end
    end
    context "successfully" do
      let(:x)           { 5 }
      let(:y)           { 5 }
      let(:orientation) { :north }
      before do
        @robot.place(x, y, orientation) 
      end
      it 'assigns attrs' do
        expect(@robot.x).to           eq x
        expect(@robot.y).to           eq y
        expect(@robot.orientation).to eq orientation
      end
    end
  end
  describe "#move" do

  end
  describe "#left" do

  end
  describe "#right" do

  end
  describe "#report" do

  end
end
