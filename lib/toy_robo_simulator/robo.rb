module ToyRoboSimulator
  class Robo
    attr_accessor :x, :y, :orientation, :errors

    def initialize
      @x_min = 0
      @x_max = 5
      @y_min = 0
      @y_max = 5
    end

    def place(x, y, orientation)
      @errors = []
      validates_coordinates_arg(x, y)
      validates_orientation(orientation.downcase.to_sym)
      if @errors.any?
        @errors.each {|error| puts error }
      else
        @x = x
        @y = y
        @orientation = orientation.downcase.to_sym
        puts "Robo is now at coordinates (#{@x},#{@y}), facing #{orientation.to_s.upcase}"
      end
    end

    def move
      @errors = []
      @errors << "The Robo is not placed yet. Use PLACE command first." unless placed?
      @errors << "The Robo is at edge. No further move is allowed."     unless current_coordinates_valid?
      if @errors.any?
        @errors.each {|error| puts error }
      else
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
        puts "Robo is now at coordinates (#{@x},#{@y}), facing #{@orientation.to_s.upcase}"
      end
    end

    private

      def placed?
        true if @x && @y && @orientation
      end

      def current_coordinates_valid?
        if (@orientation == :north && @y == @y_max) ||
           (@orientation == :east  && @x == @x_min) ||
           (@orientation == :south && @y == @y_min) ||
           (@orientation == :west  && @x == @x_min)
          false
        else
          true
        end
      end

      def validates_coordinates_arg(x, y)
        return unless is_int?(x)   && is_int?(y)
        return unless in_range?(x) && in_range?(y)
      end

      def is_int?(coordinate)
        if coordinate.to_s === coordinate.to_i.to_s
          true
        else
          @errors << "X coordinate must be an Integer"
          false
        end
      end

      def in_range?(coordinate)
        if coordinate >= 0 && coordinate <= 5
          true
        else
          @errors << "X coordinate must be between 0 and 5" 
          false
        end
      end

      def validates_orientation(orientation)
        @errors << "orientation should be either north, south, east, or west" unless %i(north south east west).include? orientation
      end
  end
end
