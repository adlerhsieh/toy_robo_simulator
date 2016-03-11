module ToyRoboSimulator
  module Validator
    def validate_placement(x, y, orientation)
      @errors << 'X must be a number' unless int?(x)
      @errors << 'Y must be a number' unless int?(y)
      @errors << "X must be between 0 and #{@table.x}" unless in_range?(x, @table.x)
      @errors << "Y must be between 0 and #{@table.y}" unless in_range?(y, @table.y)
      @errors << 'Orientation should be either NORTH, SOUTH, EAST, or WEST' unless orientation_valid?(orientation)
    end

    def validate_movement
      @errors << 'The Robo is at edge. No further move is allowed.' if at_table_edge?
    end

    def validate_if_placed
      @errors << 'The Robo is not placed yet. Use PLACE command first.' unless @x && @y && @orientation
    end

    def at_table_edge?
      (@orientation == :north && @y == @table.y) ||
        (@orientation == :east  && @x == @table.x) ||
        (@orientation == :south && @y == 0)        ||
        (@orientation == :west  && @x == 0)
    end

    private

    def int?(value)
      value.to_s == value.to_i.to_s
    end

    def in_range?(value, max)
      value.to_i >= 0 && value.to_i <= max
    end

    def orientation_valid?(orientation)
      ::ORIENTATIONS.include? orientation.downcase.to_sym
    end
  end
end
