module ToyRoboSimulator
  # Validator serves to validate operations performed by a Robo. It is a standalone module but
  # takes arguments and attributes from a Robo.
  module Validator
    # Ensures input values of Robo#place action is valid in type and range.
    # Returns false if it is not valid.
    def validate_placement(x, y, orientation)
      @errors << 'X must be a number' unless int?(x)
      @errors << 'Y must be a number' unless int?(y)
      @errors << "X must be between 0 and #{@table.x}" unless in_range?(x, @table.x)
      @errors << "Y must be between 0 and #{@table.y}" unless in_range?(y, @table.y)
      @errors << 'Orientation should be either NORTH, SOUTH, EAST, or WEST' unless orientation_valid?(orientation)
    end

    # Prevents Robo#move from moving out of the table.
    # Returns false if the Robo is at the edge of the table.
    def validate_movement
      @errors << 'The Robo is at edge. No further move is allowed.' if edge?
    end

    # Ensures the Robo is placed before any other actions are performed.
    # Returns false if no attributes are set for the Robo.
    def validate_if_placed
      @errors << 'The Robo is not placed yet. Use PLACE command first.' unless @x && @y && @orientation
    end

    private

    def int?(value)
      value.to_s == value.to_i.to_s
    end

    def in_range?(value, max)
      value.to_i >= 0 && value.to_i <= max
    end

    def orientation_valid?(orientation)
      ORIENTATIONS.include? orientation.downcase.to_sym
    end

    def edge?
      case @orientation
      when :north
        @y == @table.y
      when :east
        @x == @table.x
      when :south
        @y == 0
      when :west
        @x == 0
      end
    end
  end
end
