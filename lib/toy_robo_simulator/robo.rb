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
      @x = x.to_i
      @y = y.to_i
      @orientation = orientation.downcase.to_sym
      puts 'It is placed.'
    end

    def move
      validate_if_placed
      validate_movement
      warning && return if @errors.any?
      move_forward(1)
      puts 'It moves forward.'
    end

    def left
      validate_if_placed
      warning && return if @errors.any?
      turn(:left)
      puts 'It turns left.'
    end

    def right
      validate_if_placed
      warning && return if @errors.any?
      turn(:right)
      puts 'It turns right'
    end

    def report
      validate_if_placed
      warning && return if @errors.any?
      puts "Robo is now at (#{@x},#{@y}) facing #{@orientation.to_s.upcase}"
    end

    private

    def warning
      @errors.each { |message| puts message }
      @errors = []
    end

    def turn(direction)
      i = direction == :left ? 1 : -1
      index = ORIENTATIONS.index(@orientation) + i
      @orientation = ORIENTATIONS[index] || :north
    end

    def move_forward(unit)
      case @orientation
      when :north then @y += unit
      when :east  then @x += unit
      when :south then @y -= unit
      when :west  then @x -= unit
      end
    end
  end
end
