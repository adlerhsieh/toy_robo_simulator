module ToyRoboSimulator
  class Robo
    attr_accessor :x, :y, :orientation, :errors

    def initialize
    end

    def place(x, y, orientation)
      @errors = []
      validates_coordinates(x, y)
      validates_orientation(orientation.downcase.to_sym)
      if @errors.any?
        @errors.each {|error| puts error }
      else
        @x = x
        @y = y
        @orientation = orientation.downcase.to_sym
        puts "Robo is now at coordinates (#{@x},#{@y}), facing #{orientation}"
      end
      return true
    end

    private

      def validates_coordinates(x, y)
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
