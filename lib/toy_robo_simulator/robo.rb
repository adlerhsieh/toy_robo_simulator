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
      case orientation
      when :north then @y += 1
      when :east  then @x += 1
      when :south then @y -= 1
      when :west  then @x -= 1
      end
      puts 'It moves forward.'
    end

    def left
      validate_if_placed
      warning && return if @errors.any?
      index = ::ORIENTATIONS.index(@orientation) + 1
      @orientation = ::ORIENTATIONS[index] || :north
      puts 'It turns left.'
    end

    def right
      validate_if_placed
      warning && return if @errors.any?
      index = ::ORIENTATIONS.index(@orientation) - 1
      @orientation = ::ORIENTATIONS[index]
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
  end
end
