Orientations = %i(north west south east)

module ToyRoboSimulator
  class Robo
    attr_accessor :x, :y, :orientation

    def initialize
      @x_min = 0
      @x_max = 5
      @y_min = 0
      @y_max = 5
    end

    def place(x, y, orientation)
      return unless coordinates_valid?(x, y) && orientation_valid?(orientation.downcase.to_sym)
      @x, @y = x, y
      @orientation = orientation.downcase.to_sym
      report
    end

    def move
      return unless placed? && move_valid?
      case orientation
      when :north
        @y += 1
      when :east
        @x += 1
      when :south
        @y -= 1
      when :west
        @x -= 1
      end
      report
    end

    def left
      return unless placed?
      @orientation = Orientations[Orientations.index(@orientation) + 1] || :north
      report
    end

    def right
      return unless placed?
      @orientation = Orientations[Orientations.index(@orientation) - 1]
      report
    end

    def report
      puts "Robo is now at coordinates (#{@x},#{@y}), facing #{@orientation.to_s.upcase}"
    end

    private

    def placed?
      if @x && @y && @orientation
        true
      else
        puts 'The Robo is not placed yet. Use PLACE command first.'
        false
      end
    end

    def move_valid?
      if (@orientation == :north && @y == @y_max) ||
         (@orientation == :east  && @x == @x_min) ||
         (@orientation == :south && @y == @y_min) ||
         (@orientation == :west  && @x == @x_min)
        puts 'The Robo is at edge. No further move is allowed.'
        false
      else
        true
      end
    end

    def coordinates_valid?(x, y)
      return unless int?(x)      && int?(y)
      return unless in_range?(x) && in_range?(y)
      true
    end

    def int?(coordinate)
      unless coordinate.to_s === coordinate.to_i.to_s
        puts 'Coordinate must be an Integer'
        return false
      end
      true
    end

    def in_range?(coordinate)
      unless coordinate >= 0 && coordinate <= 5
        puts 'Coordinate must be between 0 and 5'
        return false
      end
      true
    end

    def orientation_valid?(orientation)
      unless Orientations.include? orientation
        puts 'orientation should be either NORTH, SOUTH, EAST, or WEST'
        return false
      end
      true
    end
  end
end
