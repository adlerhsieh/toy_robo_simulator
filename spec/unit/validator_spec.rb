require 'spec_helper'
require 'ostruct'

describe ToyRoboSimulator::Validator do
  subject { Class.new { include ToyRoboSimulator::Validator }.new }
  let(:errors) { subject.instance_variable_get(:@errors) }
  
  def set(key, value)
    subject.instance_variable_set(key.to_sym, value)
  end

  def place(x, y, orientation)
    set :@x, x
    set :@y, y
    set :@orientation, orientation
  end

  before do
    set :@errors, []
    set :@table, OpenStruct.new(x: 5, y: 5)
  end

  describe '#valid_placement?' do
    it 'is valid' do
      place(1, 2, :north)
      expect(subject.valid_placement?).to be_truthy
      expect(errors).to be_empty
    end
    it 'with invalid type' do
      place('foo', 'bar', 'qux')
      expect(subject.valid_placement?).to be_falsey
      expect(errors).not_to be_empty
      expect(errors).to include 'X must be a number'
      expect(errors).to include 'Y must be a number'
      expect(errors).to include 'Orientation should be either NORTH, SOUTH, EAST, or WEST'
    end
    it 'out of range' do
      place(8, 10, :north)
      expect(subject.valid_placement?).to be_falsey
      expect(errors).not_to be_empty
      expect(errors).to include 'X must be between 0 and 5'
      expect(errors).to include 'Y must be between 0 and 5'
    end
  end

  describe '#moveable?' do
    it 'is valid' do
      place(3, 3, :north)
      expect(subject.moveable?).to be_truthy
    end
    describe 'is at edge of' do
      it 'north' do
        place(3, 5, :north)
        expect(subject.moveable?).to be_falsey
      end
      it 'east' do
        place(5, 1, :east)
        expect(subject.moveable?).to be_falsey
      end
      it 'south' do
        place(0, 0, :south)
        expect(subject.moveable?).to be_falsey
      end
      it 'west' do
        place(0, 3, :west)
        expect(subject.moveable?).to be_falsey
      end
    end
  end
end
