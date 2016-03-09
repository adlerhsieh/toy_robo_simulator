require 'spec_helper'
require 'ostruct'

describe ToyRoboSimulator::Validator do
  let(:validator) { Class.new{ include ToyRoboSimulator::Validator }.new }
  before do
    validator.instance_variable_set(:@errors, [])
    validator.instance_variable_set(:@table, OpenStruct.new(x: 5, y: 5))
  end

  describe '#validate_placement' do
    it 'is valid' do
      validator.validate_placement(1, 2, :north)
      errors = validator.instance_variable_get(:@errors)
      expect(errors).to be_empty
    end
    it 'with invalid type' do
      validator.validate_placement('foo', 'bar', 'qux')
      errors = validator.instance_variable_get(:@errors)
      expect(errors).not_to be_empty
      expect(errors).to include 'X must be a number'
      expect(errors).to include 'Y must be a number'
      expect(errors).to include 'Orientation should be either NORTH, SOUTH, EAST, or WEST'
    end
    it 'out of range' do
      validator.validate_placement(8, 10, :north)
      errors = validator.instance_variable_get(:@errors)
      expect(errors).not_to be_empty
      expect(errors).to include 'X must be between 0 and 5'
      expect(errors).to include 'Y must be between 0 and 5'
    end
  end

  describe '#validate_movement' do
    it 'is valid' do
      validator.instance_variable_set(:@x, 3)
      validator.instance_variable_set(:@y, 3)
      validator.instance_variable_set(:@orientation, :north)
      validator.validate_movement
      errors = validator.instance_variable_get(:@errors)
      expect(errors).to be_empty
    end
    describe 'is at edge of' do
      it 'north' do
        validator.instance_variable_set(:@x, 3)
        validator.instance_variable_set(:@y, 5)
        validator.instance_variable_set(:@orientation, :north)
        validator.validate_movement
        errors = validator.instance_variable_get(:@errors)
        expect(errors).not_to be_empty
      end
      it 'east' do
        validator.instance_variable_set(:@x, 5)
        validator.instance_variable_set(:@y, 1)
        validator.instance_variable_set(:@orientation, :east)
        validator.validate_movement
        errors = validator.instance_variable_get(:@errors)
        expect(errors).not_to be_empty
      end
      it 'south' do
        validator.instance_variable_set(:@x, 0)
        validator.instance_variable_set(:@y, 0)
        validator.instance_variable_set(:@orientation, :south)
        validator.validate_movement
        errors = validator.instance_variable_get(:@errors)
        expect(errors).not_to be_empty
      end
      it 'west' do
        validator.instance_variable_set(:@x, 0)
        validator.instance_variable_set(:@y, 3)
        validator.instance_variable_set(:@orientation, :west)
        validator.validate_movement
        errors = validator.instance_variable_get(:@errors)
        expect(errors).not_to be_empty
      end
    end
  end
end
