module ToyRoboSimulator
  class Robo
    include Validator
    attr_accessor :x, :y, :orientation

    def initialize
      @table  = Table.new(5, 5)
      @errors = []
    end

    def place(x, y, orientation)
      validate_placement(x, y, orientation)
      warning && return if @errors.any?
      @x, @y = x.to_i, y.to_i
      @orientation = orientation.downcase.to_sym
    end

    def move
      validate_if_placed
      validate_movement
      warning && return if @errors.any?
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
    end

    def left
      validate_if_placed
      warning && return if @errors.any?
      index = ::ORIENTATIONS.index(@orientation) + 1
      @orientation = ::ORIENTATIONS[index] || :north
    end

    def right
      validate_if_placed
      warning && return if @errors.any?
      index = ::ORIENTATIONS.index(@orientation) - 1
      @orientation = ::ORIENTATIONS[index]
    end

    def report
      validate_if_placed
      warning && return if @errors.any?
      puts "Robo is now: (#{@x},#{@y}) facing #{@orientation.to_s.upcase}"
    end

    private

    def warning
      @errors.each { |message| puts message }
      @errors = []
    end

  end
end
