module ToyRoboSimulator
  # Validator serves to validate operations performed by a Robo. It is a standalone module but
  # takes arguments and attributes from a Robo.
  module Validator
    # Ensures input values of Robo#place action is valid in type and range.
    # Returns false if it is not valid, otherwise returns true.
    def valid_placement?
      validate_placement
      if @errors.any?
        @errors.each { |message| puts message }
        @x, @y, @orientation = nil, nil, nil
        false
      else
        @x, @y = @x.to_i, @y.to_i
        true
      end
    end

    # Prevents Robo#move from moving out of the table.
    # Returns false if the Robo is at the edge of the table, otherwise returns true.
    def moveable?
      if edge?
        puts 'The Robo is at edge. No further move is allowed.'
      else
        true
      end
    end

    # Ensures the Robo is placed before any other actions are performed.
    # Returns false if no attributes are set for the Robo, otherwise returns true.
    def placed?
      if @x && @y && @orientation
        true
      else
        puts 'The Robo is not placed yet. Use PLACE command first.'
        false
      end
    end

    private

    def validate_placement
      @errors = []
      @errors << 'X must be a number' unless int?(@x)
      @errors << 'Y must be a number' unless int?(@y)
      @errors << "X must be between 0 and #{@table.x}" unless in_range?(@x, @table.x)
      @errors << "Y must be between 0 and #{@table.y}" unless in_range?(@y, @table.y)
      @errors << 'It can only face NORTH, SOUTH, EAST, or WEST' unless orientation_valid?(@orientation)
    end

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
        @y.zero?
      when :west
        @x.zero?
      end
    end
  end
end
